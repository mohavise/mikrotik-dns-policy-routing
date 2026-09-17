# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# List: X domains
# RouterOS address-list: DST-X-TO-OUTBOUND
# Source: X-owned public domains (official-owned-domains)
# Normalized source domain count: 4
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-X-TO-OUTBOUND]
:do { add list=DST-X-TO-OUTBOUND address="t.co" comment="x:seed:t.co" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address="twimg.com" comment="x:seed:twimg.com" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address="twitter.com" comment="x:seed:twitter.com" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address="x.com" comment="x:seed:x.com" } on-error={}

/ip dns static
remove [find address-list=DST-X-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)t\\.co$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:dns:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:dns:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:dns:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:dns:x.com" } on-error={}
