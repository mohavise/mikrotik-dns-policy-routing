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
