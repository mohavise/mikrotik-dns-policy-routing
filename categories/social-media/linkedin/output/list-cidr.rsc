# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# List: LinkedIn CIDR
# RouterOS address-list: DST-LINKEDIN-TO-OUTBOUND
# Source: LinkedIn AS14413 announced IPv4 prefixes (asn-announced-prefixes)
# Source URL: https://stat.ripe.net/data/announced-prefixes/data.json?resource=AS14413
# Normalized source CIDR count: 25
# Exact collapsed CIDR count: 13
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-LINKEDIN-TO-OUTBOUND]
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=103.20.92.0/22 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.0.0/23 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.8.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.10.0/23 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.13.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.9.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.12.0/22 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.16.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.23.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.177.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.178.0/23 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.180.0/22 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.185.0/24 comment="linkedin-cidr" } on-error={}
