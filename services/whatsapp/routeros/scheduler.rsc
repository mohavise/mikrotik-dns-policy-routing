# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# scheduler=update-whatsapp-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-whatsapp-outbound"]] > 0) do={ remove [find name="scheduler-update-whatsapp-outbound"] }
add name=scheduler-update-whatsapp-outbound interval=1d start-time=04:01:00 on-event="/system script run update-whatsapp-outbound" policy=read,write,policy,test comment="Daily WhatsApp outbound list update"

