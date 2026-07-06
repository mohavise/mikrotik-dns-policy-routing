# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# scheduler=update-samsung-galaxy-store-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-samsung-galaxy-store-outbound"]] > 0) do={ remove [find name="scheduler-update-samsung-galaxy-store-outbound"] }
add name=scheduler-update-samsung-galaxy-store-outbound interval=1d start-time=04:01:00 on-event="/system script run update-samsung-galaxy-store-outbound" policy=read,write,policy,test comment="Daily Samsung Galaxy Store outbound list update"
