# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# List: Proxmox combined domains + CIDR
# RouterOS address-list: DST-PROXMOX-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-PROXMOX-TO-OUTBOUND]
:do { add list=DST-PROXMOX-TO-OUTBOUND address="proxmox.com" comment="proxmox:seed:proxmox.com" } on-error={}

/ip dns static
remove [find address-list=DST-PROXMOX-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)proxmox\\.com$" type=FWD address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:dns:proxmox.com" } on-error={}

/ip firewall address-list
