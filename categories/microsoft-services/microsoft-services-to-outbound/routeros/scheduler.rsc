# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# scheduler=update-microsoft-services-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-microsoft-services-outbound"]] > 0) do={ remove [find name="scheduler-update-microsoft-services-outbound"] }
add name=scheduler-update-microsoft-services-outbound interval=1d start-time=04:26:00 on-event="/system script run update-microsoft-services-outbound" policy=read,write,policy,test comment="Daily Microsoft Services outbound list update"
