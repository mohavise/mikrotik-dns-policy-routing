# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# scheduler=update-proxmox-outbound daily

/system scheduler
:if ([:len [find name="scheduler-update-proxmox-outbound"]] > 0) do={ remove [find name="scheduler-update-proxmox-outbound"] }
add name=scheduler-update-proxmox-outbound interval=1d start-time=04:01:00 on-event="/system script run update-proxmox-outbound" policy=read,write,policy,test comment="Daily Proxmox outbound list update"