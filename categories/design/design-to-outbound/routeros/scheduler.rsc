# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=design-to-outbound
# scheduler=update-design-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-design-outbound"]] > 0) do={ remove [find name="scheduler-update-design-outbound"] }
add name=scheduler-update-design-outbound interval=1d start-time=04:06:00 on-event="/system script run update-design-outbound" policy=read,write,policy,test comment="Daily design outbound list update"

