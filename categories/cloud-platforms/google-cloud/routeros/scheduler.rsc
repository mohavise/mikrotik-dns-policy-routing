# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# scheduler=update-google-cloud-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-google-cloud-outbound"]] > 0) do={ remove [find name="scheduler-update-google-cloud-outbound"] }
add name=scheduler-update-google-cloud-outbound interval=1d start-time=04:01:00 on-event="/system script run update-google-cloud-outbound" policy=read,write,policy,test comment="Daily Google Cloud outbound list update"
