# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# List: Canva CIDR
# RouterOS address-list: DST-CANVA-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-11 00:57:20 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-CANVA-TO-OUTBOUND]
