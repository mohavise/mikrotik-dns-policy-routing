# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian CIDR
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-06 16:00:18 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DEBIAN-TO-OUTBOUND]
