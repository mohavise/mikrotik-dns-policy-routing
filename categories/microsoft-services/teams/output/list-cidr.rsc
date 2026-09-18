# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams CIDR
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# Source: Microsoft 365 official Teams/Skype endpoint web service (official-web-service)
# Source URL: https://endpoints.office.com/endpoints/Worldwide?ServiceAreas=Skype&NoIPv6=true&ClientRequestId=41b55b14-a4c4-4dc1-97db-62d31ed24088
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-TEAMS-TO-OUTBOUND]
:do { add list=DST-TEAMS-TO-OUTBOUND address=13.107.140.6/32 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=13.107.18.15/32 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=13.107.6.171/32 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=13.107.6.192/32 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=13.107.9.192/32 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=20.190.128.0/18 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=20.20.32.0/19 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=20.231.128.0/19 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=40.126.0.0/18 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=52.108.0.0/14 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=52.112.0.0/14 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=52.122.0.0/15 comment="teams-cidr" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address=52.244.37.168/32 comment="teams-cidr" } on-error={}
