# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# scheduler=update-onedrive-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-onedrive-outbound"]] > 0) do={ remove [find name="scheduler-update-onedrive-outbound"] }
add name=scheduler-update-onedrive-outbound interval=1d start-time=04:22:00 on-event="/system script run update-onedrive-outbound" policy=read,write,policy,test comment="Daily OneDrive outbound list update"
