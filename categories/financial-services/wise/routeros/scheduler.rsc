# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# scheduler=update-wise-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-wise-outbound"]] > 0) do={ remove [find name="scheduler-update-wise-outbound"] }
add name=scheduler-update-wise-outbound interval=1d start-time=04:01:00 on-event="/system script run update-wise-outbound" policy=read,write,policy,test comment="Daily Wise outbound list update"
