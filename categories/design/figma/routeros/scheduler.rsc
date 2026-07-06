# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# scheduler=update-figma-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-figma-outbound"]] > 0) do={ remove [find name="scheduler-update-figma-outbound"] }
add name=scheduler-update-figma-outbound interval=1d start-time=04:01:00 on-event="/system script run update-figma-outbound" policy=read,write,policy,test comment="Daily Figma outbound list update"

