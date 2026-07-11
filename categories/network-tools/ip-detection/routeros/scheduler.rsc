# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# scheduler=update-ip-detection-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-ip-detection-outbound"]] > 0) do={ remove [find name="scheduler-update-ip-detection-outbound"] }
add name=scheduler-update-ip-detection-outbound interval=1d start-time=04:12:00 on-event="/system script run update-ip-detection-outbound" policy=read,write,policy,test comment="Daily IP Detection list update"
