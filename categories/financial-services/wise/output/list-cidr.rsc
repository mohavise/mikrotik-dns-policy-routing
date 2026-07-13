# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise CIDR
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-13 11:35:16 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WISE-TO-OUTBOUND]
