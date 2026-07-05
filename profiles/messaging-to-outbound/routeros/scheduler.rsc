# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=messaging-to-outbound
# scheduler=update-messaging-outbound daily

/system scheduler
add name=scheduler-update-messaging-outbound interval=1d start-time=04:06:00 on-event="/system script run update-messaging-outbound" policy=read,write,policy,test comment="Daily messaging outbound list update"
