# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=developer-to-outbound
# scheduler=update-developer-outbound daily

/system scheduler
add name=scheduler-update-developer-outbound interval=1d start-time=04:06:00 on-event="/system script run update-developer-outbound" policy=read,write,policy,test comment="Daily developer outbound list update"

