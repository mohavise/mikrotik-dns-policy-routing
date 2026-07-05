# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# scheduler=update-instagram-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-instagram-outbound"]] > 0) do={ remove [find name="scheduler-update-instagram-outbound"] }
add name=scheduler-update-instagram-outbound interval=1d start-time=04:01:00 on-event="/system script run update-instagram-outbound" policy=read,write,policy,test comment="Daily Instagram outbound list update"

