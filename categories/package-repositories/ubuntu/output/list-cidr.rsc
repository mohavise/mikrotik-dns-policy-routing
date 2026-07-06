# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# List: Ubuntu CIDR
# RouterOS address-list: DST-UBUNTU-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-06 16:06:40 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-UBUNTU-TO-OUTBOUND]
