# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# List: Instagram combined domains + CIDR
# RouterOS address-list: DST-INSTAGRAM-TO-OUTBOUND
# Domain source: Meta-owned Instagram public domains (official-owned-domains)
# Last update: 2026-07-13 01:05:35 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-INSTAGRAM-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdninstagram\\.com\$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me\$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com\$" type=FWD address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list
remove [find list=DST-INSTAGRAM-TO-OUTBOUND]
