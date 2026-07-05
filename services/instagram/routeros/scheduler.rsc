# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# scheduler=update-instagram-outbound daily

/system scheduler
add name=scheduler-update-instagram-outbound interval=1d start-time=04:25:00 on-event="/system script run update-instagram-outbound" policy=read,write,policy,test comment="Daily Instagram outbound list update"

