# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# scheduler=update-x-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-x-outbound"]] > 0) do={ remove [find name="scheduler-update-x-outbound"] }
add name=scheduler-update-x-outbound interval=1d start-time=04:01:00 on-event="/system script run update-x-outbound" policy=read,write,policy,test comment="Daily X outbound list update"

