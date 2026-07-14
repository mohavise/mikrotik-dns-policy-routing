# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# scheduler=update-reddit-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-reddit-outbound"]] > 0) do={ remove [find name="scheduler-update-reddit-outbound"] }
add name=scheduler-update-reddit-outbound interval=1d start-time=04:01:00 on-event="/system script run update-reddit-outbound" policy=read,write,policy,test comment="Daily Reddit outbound list update"
