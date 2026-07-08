# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# scheduler=update-microsoft-365-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-microsoft-365-outbound"]] > 0) do={ remove [find name="scheduler-update-microsoft-365-outbound"] }
add name=scheduler-update-microsoft-365-outbound interval=1d start-time=04:21:00 on-event="/system script run update-microsoft-365-outbound" policy=read,write,policy,test comment="Daily Microsoft 365 outbound list update"
