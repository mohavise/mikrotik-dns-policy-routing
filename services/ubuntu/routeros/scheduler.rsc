# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# scheduler=update-ubuntu-outbound daily

/system scheduler
add name=scheduler-update-ubuntu-outbound interval=1d start-time=04:01:00 on-event="/system script run update-ubuntu-outbound" policy=read,write,policy,test comment="Daily Ubuntu outbound list update"