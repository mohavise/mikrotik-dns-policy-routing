# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# List: Reddit CIDR
# RouterOS address-list: DST-REDDIT-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-18 00:56:23 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-REDDIT-TO-OUTBOUND]
