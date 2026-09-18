# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma CIDR
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# Source: manual verified additions
# Normalized source CIDR count: 0
# Exact collapsed CIDR count: 0
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-FIGMA-TO-OUTBOUND]
