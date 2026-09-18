# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# List: Microsoft 365 CIDR
# RouterOS address-list: DST-MICROSOFT-365-TO-OUTBOUND
# Source: Microsoft 365 official endpoint web service (official-web-service)
# Source URL: https://endpoints.office.com/endpoints/Worldwide?NoIPv6=true&ClientRequestId=6e61d94e-bd8d-4a1e-83a0-91e7d1dbf650
# Normalized source CIDR count: 34
# Exact collapsed CIDR count: 31
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-365-TO-OUTBOUND]
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.6.152/31 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.6.171/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.6.192/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.9.192/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.18.10/31 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.18.15/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.128.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.136.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=13.107.140.6/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=20.20.32.0/19 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=20.190.128.0/18 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=20.231.128.0/19 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=23.103.160.0/20 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=40.92.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=40.96.0.0/13 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=40.104.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=40.107.0.0/16 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=40.108.128.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=40.126.0.0/18 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=52.96.0.0/12 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=52.112.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=52.122.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=52.238.78.88/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=52.244.37.168/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=104.47.0.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=104.146.128.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=131.253.33.215/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=132.245.0.0/16 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=150.171.32.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=150.171.40.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address=204.79.197.215/32 comment="microsoft-365-cidr" } on-error={}
