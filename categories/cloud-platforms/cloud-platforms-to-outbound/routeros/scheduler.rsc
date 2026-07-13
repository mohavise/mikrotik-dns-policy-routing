# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-platforms-to-outbound
# scheduler=update-cloud-platforms-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-cloud-platforms-outbound"]] > 0) do={ remove [find name="scheduler-update-cloud-platforms-outbound"] }
add name=scheduler-update-cloud-platforms-outbound interval=1d start-time=04:06:00 on-event="/system script run update-cloud-platforms-outbound" policy=read,write,policy,test comment="Daily Cloud platforms outbound list update"
