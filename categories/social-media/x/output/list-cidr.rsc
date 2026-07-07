# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# List: X CIDR
# RouterOS address-list: DST-X-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-07 10:40:36 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-X-TO-OUTBOUND]
