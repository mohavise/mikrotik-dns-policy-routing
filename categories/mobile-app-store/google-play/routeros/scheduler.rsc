# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# scheduler=update-google-play-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-google-play-outbound"]] > 0) do={ remove [find name="scheduler-update-google-play-outbound"] }
add name=scheduler-update-google-play-outbound interval=1d start-time=04:01:00 on-event="/system script run update-google-play-outbound" policy=read,write,policy,test comment="Daily Google Play outbound list update"
