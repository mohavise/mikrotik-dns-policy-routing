# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-drive
# scheduler=update-google-drive-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-google-drive-outbound"]] > 0) do={ remove [find name="scheduler-update-google-drive-outbound"] }
add name=scheduler-update-google-drive-outbound interval=1d start-time=04:01:00 on-event="/system script run update-google-drive-outbound" policy=read,write,policy,test comment="Daily Google Drive outbound list update"

