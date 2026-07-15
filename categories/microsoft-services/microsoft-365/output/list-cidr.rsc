# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# List: Microsoft 365 CIDR
# RouterOS address-list: DST-MICROSOFT-365-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-15 00:51:08 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-365-TO-OUTBOUND]
