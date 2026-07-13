# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# scheduler=update-aws-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-aws-outbound"]] > 0) do={ remove [find name="scheduler-update-aws-outbound"] }
add name=scheduler-update-aws-outbound interval=1d start-time=04:01:00 on-event="/system script run update-aws-outbound" policy=read,write,policy,test comment="Daily AWS outbound list update"
