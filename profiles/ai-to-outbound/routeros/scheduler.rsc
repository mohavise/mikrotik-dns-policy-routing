# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=ai-to-outbound
# scheduler=update-ai-outbound daily

/system scheduler
add name=scheduler-update-ai-outbound interval=1d start-time=04:06:00 on-event="/system script run update-ai-outbound" policy=read,write,policy,test comment="Daily AI outbound list update"

