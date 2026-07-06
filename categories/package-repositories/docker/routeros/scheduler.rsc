# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# scheduler=update-docker-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-docker-outbound"]] > 0) do={ remove [find name="scheduler-update-docker-outbound"] }
add name=scheduler-update-docker-outbound interval=1d start-time=04:01:00 on-event="/system script run update-docker-outbound" policy=read,write,policy,test comment="Daily Docker outbound list update"