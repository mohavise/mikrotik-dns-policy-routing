# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams domains
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Normalized source domain count: 8
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TEAMS-TO-OUTBOUND]
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:live.com" } on-error={}
:do { add name="lync.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:microsoft.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:office.net" } on-error={}
:do { add name="sfbassets.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add name="skype.com" type=FWD match-subdomain=yes address-list=DST-TEAMS-TO-OUTBOUND comment="teams:skype.com" } on-error={}
