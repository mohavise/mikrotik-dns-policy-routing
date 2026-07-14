# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# scheduler=update-discord-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-discord-outbound"]] > 0) do={ remove [find name="scheduler-update-discord-outbound"] }
add name=scheduler-update-discord-outbound interval=1d start-time=04:01:00 on-event="/system script run update-discord-outbound" policy=read,write,policy,test comment="Daily Discord outbound list update"
