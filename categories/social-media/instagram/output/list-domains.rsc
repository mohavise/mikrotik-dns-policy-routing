# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# List: Instagram domains
# RouterOS address-list: DST-INSTAGRAM-TO-OUTBOUND
# Source: Meta-owned Instagram public domains (official-owned-domains)
# Normalized source domain count: 3
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-INSTAGRAM-TO-OUTBOUND]
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address="cdninstagram.com" comment="instagram:seed:cdninstagram.com" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address="ig.me" comment="instagram:seed:ig.me" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address="instagram.com" comment="instagram:seed:instagram.com" } on-error={}

/ip dns static
remove [find address-list=DST-INSTAGRAM-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdninstagram\\.com$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:dns:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:dns:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:dns:instagram.com" } on-error={}
