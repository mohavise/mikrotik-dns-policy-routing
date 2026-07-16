# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# List: Proxmox combined domains + CIDR
# RouterOS address-list: DST-PROXMOX-TO-OUTBOUND
# Domain source: Proxmox package repository documentation (official-repository-domains)
# Last update: 2026-07-16 00:56:32 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PROXMOX-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)download\\.proxmox\\.com\$" type=FWD address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:download.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)enterprise\\.proxmox\\.com\$" type=FWD address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:enterprise.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)pbs\\.proxmox\\.com\$" type=FWD address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:pbs.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)pve\\.proxmox\\.com\$" type=FWD address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:pve.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)shop\\.proxmox\\.com\$" type=FWD address-list=DST-PROXMOX-TO-OUTBOUND comment="proxmox:shop.proxmox.com" } on-error={}

/ip firewall address-list
remove [find list=DST-PROXMOX-TO-OUTBOUND]
