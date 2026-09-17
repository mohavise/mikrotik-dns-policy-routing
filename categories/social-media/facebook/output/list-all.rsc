# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# List: Facebook combined domains + CIDR
# RouterOS address-list: DST-FACEBOOK-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FACEBOOK-TO-OUTBOUND]
:do { add name="facebook.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add name="fb.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add name="fbcdn.net" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add name="fbsbx.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add name="m.me" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add name="messenger.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list
remove [find list=DST-FACEBOOK-TO-OUTBOUND]
