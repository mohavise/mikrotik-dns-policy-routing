# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# List: Microsoft 365 CIDR
# RouterOS address-list: DST-MICROSOFT-365-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-10 10:38:31 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-365-TO-OUTBOUND]
