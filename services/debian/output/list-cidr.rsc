# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian CIDR
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-05 14:19:08 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DEBIAN-TO-OUTBOUND comment="debian-cidr"]
