# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# List: Proxmox CIDR
# RouterOS address-list: DST-PROXMOX-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-06 16:06:46 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-PROXMOX-TO-OUTBOUND]
