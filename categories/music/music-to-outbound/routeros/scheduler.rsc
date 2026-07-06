# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=music-to-outbound
# scheduler=update-music-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-music-outbound"]] > 0) do={ remove [find name="scheduler-update-music-outbound"] }
add name=scheduler-update-music-outbound interval=1d start-time=04:06:00 on-event="/system script run update-music-outbound" policy=read,write,policy,test comment="Daily Music outbound list update"

