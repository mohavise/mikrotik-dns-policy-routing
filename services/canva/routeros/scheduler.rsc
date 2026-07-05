# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# scheduler=update-canva-outbound daily

/system scheduler
add name=scheduler-update-canva-outbound interval=1d start-time=04:01:00 on-event="/system script run update-canva-outbound" policy=read,write,policy,test comment="Daily Canva outbound list update"

