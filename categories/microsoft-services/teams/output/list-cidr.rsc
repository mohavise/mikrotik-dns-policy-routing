# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams CIDR
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# Source: manual verified additions
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-TEAMS-TO-OUTBOUND]
