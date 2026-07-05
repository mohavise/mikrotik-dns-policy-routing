# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# scheduler=update-linkedin-outbound daily

/system scheduler
add name=scheduler-update-linkedin-outbound interval=1d start-time=04:45:00 on-event="/system script run update-linkedin-outbound" policy=read,write,policy,test comment="Daily LinkedIn outbound list update"
