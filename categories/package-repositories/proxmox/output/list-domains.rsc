# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# List: Proxmox domains
# RouterOS address-list: DST-PROXMOX-TO-OUTBOUND
# Source: Proxmox package repository documentation (official-repository-domains)
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PROXMOX-TO-OUTBOUND]
:do { add name="download.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:download.proxmox.com" } on-error={}
:do { add name="enterprise.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:enterprise.proxmox.com" } on-error={}
:do { add name="pbs.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:pbs.proxmox.com" } on-error={}
:do { add name="pve.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:pve.proxmox.com" } on-error={}
:do { add name="shop.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:shop.proxmox.com" } on-error={}
