# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=youtube
# scheduler=update-youtube-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-youtube-outbound"]] > 0) do={ remove [find name="scheduler-update-youtube-outbound"] }
add name=scheduler-update-youtube-outbound interval=1d start-time=04:01:00 on-event="/system script run update-youtube-outbound" policy=read,write,policy,test comment="Daily YouTube outbound list update"

