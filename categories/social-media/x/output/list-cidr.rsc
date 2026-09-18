# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# List: X CIDR
# RouterOS address-list: DST-X-TO-OUTBOUND
# Source: X/Twitter AS13414 announced IPv4 prefixes (asn-announced-prefixes)
# Source URL: https://stat.ripe.net/data/announced-prefixes/data.json?resource=AS13414
# Normalized source CIDR count: 27
# Exact collapsed CIDR count: 11
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-X-TO-OUTBOUND]
:do { add list=DST-X-TO-OUTBOUND address=64.63.0.0/18 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=103.252.112.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.41.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.42.0/24 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=104.244.44.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=188.64.224.0/21 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=192.133.76.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.16.156.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.59.148.0/22 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=199.96.56.0/23 comment="x-cidr" } on-error={}
:do { add list=DST-X-TO-OUTBOUND address=202.160.128.0/22 comment="x-cidr" } on-error={}
