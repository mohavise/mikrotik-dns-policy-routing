# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# List: Microsoft Azure CIDR
# RouterOS address-list: DST-MICROSOFT-AZURE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-17 01:02:07 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
