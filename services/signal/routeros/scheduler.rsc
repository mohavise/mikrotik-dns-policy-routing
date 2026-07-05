# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# scheduler=update-signal-outbound daily

/system scheduler
add name=scheduler-update-signal-outbound interval=1d start-time=04:01:00 on-event="/system script run update-signal-outbound" policy=read,write,policy,test comment="Daily Signal outbound list update"

