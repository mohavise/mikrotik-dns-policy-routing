# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# scheduler=update-debian-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-debian-outbound"]] > 0) do={ remove [find name="scheduler-update-debian-outbound"] }
add name=scheduler-update-debian-outbound interval=1d start-time=04:01:00 on-event="/system script run update-debian-outbound" policy=read,write,policy,test comment="Daily Debian outbound list update"