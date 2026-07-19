# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# List: Windows Update CIDR
# RouterOS address-list: DST-WINDOWS-UPDATE-TO-OUTBOUND
# Source: manual verified additions
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
