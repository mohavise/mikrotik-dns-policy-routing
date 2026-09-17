# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams domains
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TEAMS-TO-OUTBOUND]
:do { add name="lync.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add name="sfbassets.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add name="skype.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:skype.com" } on-error={}
:do { add name="statics.teams.cdn.office.net" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:statics.teams.cdn.office.net" } on-error={}
:do { add name="teams.cdn.office.net" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:teams.cdn.office.net" } on-error={}
:do { add name="teams.live.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:teams.live.com" } on-error={}
:do { add name="teams.microsoft.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:teams.microsoft.com" } on-error={}
:do { add name="users.storage.live.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:users.storage.live.com" } on-error={}
