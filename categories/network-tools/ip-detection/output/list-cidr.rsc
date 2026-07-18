# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# List: IP Detection CIDR
# RouterOS address-list: IP-DETECTION
# Source: manual verified additions
# Last update: 2026-07-18 00:56:22 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=IP-DETECTION]
