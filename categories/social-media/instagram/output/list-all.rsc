# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# List: Instagram combined domains + CIDR
# RouterOS address-list: DST-INSTAGRAM-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-INSTAGRAM-TO-OUTBOUND]
:do { add name="cdninstagram.com" type=FWD match-subdomain=yes address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add name="ig.me" type=FWD match-subdomain=yes address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add name="instagram.com" type=FWD match-subdomain=yes address-list=DST-INSTAGRAM-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list
remove [find list=DST-INSTAGRAM-TO-OUTBOUND]
