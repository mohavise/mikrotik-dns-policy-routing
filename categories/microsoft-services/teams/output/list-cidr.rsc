# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# List: Microsoft Teams CIDR
# RouterOS address-list: DST-TEAMS-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-14 00:53:34 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-TEAMS-TO-OUTBOUND]
