# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# scheduler=update-github-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-github-outbound"]] > 0) do={ remove [find name="scheduler-update-github-outbound"] }
add name=scheduler-update-github-outbound interval=1d start-time=04:01:00 on-event="/system script run update-github-outbound" policy=read,write,policy,test comment="Daily GitHub outbound list update"

