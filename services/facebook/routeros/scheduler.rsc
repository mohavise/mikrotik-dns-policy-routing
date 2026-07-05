# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# scheduler=update-facebook-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-facebook-outbound"]] > 0) do={ remove [find name="scheduler-update-facebook-outbound"] }
add name=scheduler-update-facebook-outbound interval=1d start-time=04:01:00 on-event="/system script run update-facebook-outbound" policy=read,write,policy,test comment="Daily Facebook outbound list update"

