# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# scheduler=update-teams-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-teams-outbound"]] > 0) do={ remove [find name="scheduler-update-teams-outbound"] }
add name=scheduler-update-teams-outbound interval=1d start-time=04:23:00 on-event="/system script run update-teams-outbound" policy=read,write,policy,test comment="Daily Microsoft Teams outbound list update"
