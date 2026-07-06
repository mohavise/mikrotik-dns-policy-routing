# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# scheduler=update-apple-app-store-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-apple-app-store-outbound"]] > 0) do={ remove [find name="scheduler-update-apple-app-store-outbound"] }
add name=scheduler-update-apple-app-store-outbound interval=1d start-time=04:01:00 on-event="/system script run update-apple-app-store-outbound" policy=read,write,policy,test comment="Daily Apple App Store outbound list update"
