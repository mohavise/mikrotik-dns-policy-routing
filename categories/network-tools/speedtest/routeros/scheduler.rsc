# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# scheduler=update-speedtest-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-speedtest-outbound"]] > 0) do={ remove [find name="scheduler-update-speedtest-outbound"] }
add name=scheduler-update-speedtest-outbound interval=1d start-time=04:11:00 on-event="/system script run update-speedtest-outbound" policy=read,write,policy,test comment="Daily Speedtest list update"
