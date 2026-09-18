# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# List: Instagram combined domains + CIDR
# RouterOS address-list: DST-INSTAGRAM-TO-OUTBOUND
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

/ip firewall address-list
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=31.13.24.0/21 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=31.13.64.0/18 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=45.64.40.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.0.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.2.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.4.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.6.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.8.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.10.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.12.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.14.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.16.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.20.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.22.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.141.24.0/24 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=57.144.0.0/14 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=66.220.144.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=69.63.176.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=69.171.224.0/19 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=74.119.76.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=102.132.96.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=103.4.96.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=129.134.0.0/17 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=157.240.0.0/17 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=157.240.192.0/18 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=163.70.128.0/17 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=163.77.132.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=163.77.136.0/23 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=163.77.160.0/20 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=173.252.64.0/18 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=179.60.192.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=185.60.216.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=185.89.216.0/22 comment="instagram-cidr" } on-error={}
:do { add list=DST-INSTAGRAM-TO-OUTBOUND address=204.15.20.0/22 comment="instagram-cidr" } on-error={}
