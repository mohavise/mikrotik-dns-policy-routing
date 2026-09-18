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
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=31.13.24.0/21 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=31.13.64.0/18 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=45.64.40.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.0.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.2.0/23 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.4.0/23 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.6.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.8.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.10.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.12.0/23 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.14.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.16.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.20.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.22.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.141.24.0/24 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=57.144.0.0/14 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=66.220.144.0/20 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=69.63.176.0/20 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=69.171.224.0/19 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=74.119.76.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=102.132.96.0/20 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=103.4.96.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=129.134.0.0/17 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=157.240.0.0/17 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=157.240.192.0/18 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=163.70.128.0/17 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=163.77.132.0/23 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=163.77.136.0/23 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=163.77.160.0/20 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=173.252.64.0/18 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=179.60.192.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=185.60.216.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=185.89.216.0/22 comment="facebook-cidr" } on-error={}
:do { add list=DST-FACEBOOK-TO-OUTBOUND address=204.15.20.0/22 comment="facebook-cidr" } on-error={}
