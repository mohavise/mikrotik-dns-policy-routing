# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# List: OneDrive CIDR
# RouterOS address-list: DST-ONEDRIVE-TO-OUTBOUND
# Source: Microsoft 365 official SharePoint/OneDrive endpoint web service (official-web-service)
# Source URL: https://endpoints.office.com/endpoints/Worldwide?ServiceAreas=SharePoint&NoIPv6=true&ClientRequestId=a2dd50e3-0f25-48d7-abf8-e933b54f15f0
# Normalized source CIDR count: 16
# Exact collapsed CIDR count: 15
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-ONEDRIVE-TO-OUTBOUND]
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.6.171/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.6.192/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.9.192/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.18.15/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.136.0/22 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.140.6/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=20.20.32.0/19 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=20.190.128.0/18 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=20.231.128.0/19 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=40.108.128.0/17 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=40.126.0.0/18 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=52.104.0.0/13 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=52.244.37.168/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=104.146.128.0/17 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=150.171.40.0/22 comment="onedrive-cidr" } on-error={}
