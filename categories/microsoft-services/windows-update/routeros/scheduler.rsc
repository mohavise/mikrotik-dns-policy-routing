# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# scheduler=update-windows-update-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-windows-update-outbound"]] > 0) do={ remove [find name="scheduler-update-windows-update-outbound"] }
add name=scheduler-update-windows-update-outbound interval=1d start-time=04:24:00 on-event="/system script run update-windows-update-outbound" policy=read,write,policy,test comment="Daily Windows Update outbound list update"
