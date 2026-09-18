# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams combined domains + CIDR
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-TEAMS-TO-OUTBOUND]
:do { add list=DST-TEAMS-TO-OUTBOUND address="live.com" comment="teams:seed:live.com" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address="lync.com" comment="teams:seed:lync.com" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address="microsoft.com" comment="teams:seed:microsoft.com" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address="office.net" comment="teams:seed:office.net" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address="sfbassets.com" comment="teams:seed:sfbassets.com" } on-error={}
:do { add list=DST-TEAMS-TO-OUTBOUND address="skype.com" comment="teams:seed:skype.com" } on-error={}

/ip dns static
remove [find address-list=DST-TEAMS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)lync\\.com$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:dns:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:dns:office.net" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:dns:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:dns:skype.com" } on-error={}

/ip firewall address-list
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
