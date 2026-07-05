# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-storage-to-outbound
# scheduler=update-cloud-storage-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-cloud-storage-outbound"]] > 0) do={ remove [find name="scheduler-update-cloud-storage-outbound"] }
add name=scheduler-update-cloud-storage-outbound interval=1d start-time=04:06:00 on-event="/system script run update-cloud-storage-outbound" policy=read,write,policy,test comment="Daily cloud storage outbound list update"

