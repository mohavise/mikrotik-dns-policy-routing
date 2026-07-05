# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# List: Instagram combined domains + CIDR
# RouterOS address-list: DST-INSTAGRAM-TO-OUTBOUND
# Domain source: Meta-owned Instagram public domains (official-owned-domains)
# Last update: 2026-07-05 09:46:02 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-INSTAGRAM-TO-OUTBOUND comment~"instagram:"]
:do { add regexp="(^|.*\\.)cdninstagram\\.com\$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me\$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com\$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list
remove [find list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram-cidr"]
