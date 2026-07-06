# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# scheduler=update-redhat-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-redhat-outbound"]] > 0) do={ remove [find name="scheduler-update-redhat-outbound"] }
add name=scheduler-update-redhat-outbound interval=1d start-time=04:01:00 on-event="/system script run update-redhat-outbound" policy=read,write,policy,test comment="Daily Red Hat outbound list update"