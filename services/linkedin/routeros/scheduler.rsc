# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# scheduler=update-linkedin-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-linkedin-outbound"]] > 0) do={ remove [find name="scheduler-update-linkedin-outbound"] }
add name=scheduler-update-linkedin-outbound interval=1d start-time=04:01:00 on-event="/system script run update-linkedin-outbound" policy=read,write,policy,test comment="Daily LinkedIn outbound list update"
