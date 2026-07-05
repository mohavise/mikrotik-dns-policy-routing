# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=package-repositories-to-outbound
# scheduler=update-package-repositories-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-package-repositories-outbound"]] > 0) do={ remove [find name="scheduler-update-package-repositories-outbound"] }
add name=scheduler-update-package-repositories-outbound interval=1d start-time=04:06:00 on-event="/system script run update-package-repositories-outbound" policy=read,write,policy,test comment="Daily package repositories outbound list update"