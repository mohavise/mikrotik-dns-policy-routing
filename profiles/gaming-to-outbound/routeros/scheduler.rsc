# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# scheduler=update-gaming-outbound daily

/system scheduler
add name=scheduler-update-gaming-outbound interval=1d start-time=04:06:00 on-event="/system script run update-gaming-outbound" policy=read,write,policy,test comment="Daily Gaming outbound list update"

