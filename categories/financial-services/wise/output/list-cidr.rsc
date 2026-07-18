# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise CIDR
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-18 00:56:21 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WISE-TO-OUTBOUND]
