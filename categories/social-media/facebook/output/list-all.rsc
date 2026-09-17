# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# List: Facebook combined domains + CIDR
# RouterOS address-list: DST-FACEBOOK-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-FACEBOOK-TO-OUTBOUND]
:do { add list=DST-FACEBOOK-TO-OUTBOUND address="facebook.com" comment="facebook:seed:facebook.com" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address="fb.com" comment="facebook:seed:fb.com" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address="fbcdn.net" comment="facebook:seed:fbcdn.net" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address="fbsbx.com" comment="facebook:seed:fbsbx.com" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address="m.me" comment="facebook:seed:m.me" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address="messenger.com" comment="facebook:seed:messenger.com" } on-error={}

/ip dns static
remove [find address-list=DST-FACEBOOK-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)facebook\\.com$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:dns:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:dns:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:dns:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:dns:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:dns:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:dns:messenger.com" } on-error={}

/ip firewall address-list
