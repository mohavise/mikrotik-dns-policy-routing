# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=mobile-app-store-to-outbound
# scheduler=update-mobile-app-store-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-mobile-app-store-outbound"]] > 0) do={ remove [find name="scheduler-update-mobile-app-store-outbound"] }
add name=scheduler-update-mobile-app-store-outbound interval=1d start-time=04:06:00 on-event="/system script run update-mobile-app-store-outbound" policy=read,write,policy,test comment="Daily mobile app store outbound list update"
