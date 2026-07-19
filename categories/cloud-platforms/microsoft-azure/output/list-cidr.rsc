# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# List: Microsoft Azure CIDR
# RouterOS address-list: DST-MICROSOFT-AZURE-TO-OUTBOUND
# Source: manual verified additions
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
