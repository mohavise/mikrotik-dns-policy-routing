# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=steam
# scheduler=update-steam-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-steam-outbound"]] > 0) do={ remove [find name="scheduler-update-steam-outbound"] }
add name=scheduler-update-steam-outbound interval=1d start-time=04:01:00 on-event="/system script run update-steam-outbound" policy=read,write,policy,test comment="Daily steam outbound list update"

