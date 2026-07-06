# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# scheduler=update-canva-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-canva-outbound"]] > 0) do={ remove [find name="scheduler-update-canva-outbound"] }
add name=scheduler-update-canva-outbound interval=1d start-time=04:01:00 on-event="/system script run update-canva-outbound" policy=read,write,policy,test comment="Daily Canva outbound list update"

