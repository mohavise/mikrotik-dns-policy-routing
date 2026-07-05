# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=google-services-to-outbound
# scheduler=update-google-services-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-google-services-outbound"]] > 0) do={ remove [find name="scheduler-update-google-services-outbound"] }
add name=scheduler-update-google-services-outbound interval=1d start-time=04:06:00 on-event="/system script run update-google-services-outbound" policy=read,write,policy,test comment="Daily Google services outbound list update"

