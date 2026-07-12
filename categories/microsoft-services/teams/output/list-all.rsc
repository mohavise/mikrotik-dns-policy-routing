# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams combined domains + CIDR
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# Domain source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Last update: 2026-07-12 01:05:03 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TEAMS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)lync\\.com\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:skype.com" } on-error={}
:do { add regexp="(^|.*\\.)statics\\.teams\\.cdn\\.office\\.net\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:statics.teams.cdn.office.net" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.cdn\\.office\\.net\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:teams.cdn.office.net" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.live\\.com\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:teams.live.com" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.microsoft\\.com\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:teams.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)users\\.storage\\.live\\.com\$" type=FWD address-list=DST-TEAMS-TO-OUTBOUND comment="teams:users.storage.live.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TEAMS-TO-OUTBOUND]
