# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# scheduler=update-microsoft-azure-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-microsoft-azure-outbound"]] > 0) do={ remove [find name="scheduler-update-microsoft-azure-outbound"] }
add name=scheduler-update-microsoft-azure-outbound interval=1d start-time=04:01:00 on-event="/system script run update-microsoft-azure-outbound" policy=read,write,policy,test comment="Daily Microsoft Azure outbound list update"
