# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# List: Instagram CIDR
# RouterOS address-list: DST-INSTAGRAM-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-11 00:57:21 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-INSTAGRAM-TO-OUTBOUND]
