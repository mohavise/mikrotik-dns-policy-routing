# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# List: Proxmox combined domains + CIDR
# RouterOS address-list: DST-PROXMOX-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PROXMOX-TO-OUTBOUND]
:do { add name="proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:proxmox.com" } on-error={}

/ip firewall address-list
remove [find list=DST-PROXMOX-TO-OUTBOUND]
