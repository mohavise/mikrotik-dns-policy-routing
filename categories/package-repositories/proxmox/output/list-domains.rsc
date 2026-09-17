# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# List: Proxmox domains
# RouterOS address-list: DST-PROXMOX-TO-OUTBOUND
# Source: Proxmox package repository documentation (official-repository-domains)
# Normalized source domain count: 5
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PROXMOX-TO-OUTBOUND]
:do { add name="proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:proxmox.com" } on-error={}
