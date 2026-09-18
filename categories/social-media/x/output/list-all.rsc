# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# List: X combined domains + CIDR
# RouterOS address-list: DST-X-TO-OUTBOUND
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

/ip firewall address-list
:do { add list=DST-X-TO-OUTBOUND address=103.252.112.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=103.252.114.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.41.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.42.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.44.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.45.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.46.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.47.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=188.64.224.0/21 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=192.133.76.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.16.156.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.16.156.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.59.148.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.96.56.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=202.160.128.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=202.160.129.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=202.160.130.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=202.160.131.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.0.0/18 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.30.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.31.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.33.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.46.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.47.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.49.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.62.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=64.63.63.0/24 comment="x-cidr" } on-error={}
