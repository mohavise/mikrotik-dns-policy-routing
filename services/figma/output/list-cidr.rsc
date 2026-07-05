# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma CIDR
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-05 12:03:17 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-FIGMA-TO-OUTBOUND comment="figma-cidr"]
