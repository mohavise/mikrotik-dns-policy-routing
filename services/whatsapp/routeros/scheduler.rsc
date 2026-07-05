# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# scheduler=update-whatsapp-outbound daily

/system scheduler
add name=scheduler-update-whatsapp-outbound interval=1d start-time=04:30:00 on-event="/system script run update-whatsapp-outbound" policy=read,write,policy,test comment="Daily WhatsApp outbound list update"

