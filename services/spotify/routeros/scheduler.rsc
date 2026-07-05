# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=spotify
# scheduler=update-spotify-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-spotify-outbound"]] > 0) do={ remove [find name="scheduler-update-spotify-outbound"] }
add name=scheduler-update-spotify-outbound interval=1d start-time=04:01:00 on-event="/system script run update-spotify-outbound" policy=read,write,policy,test comment="Daily spotify outbound list update"

