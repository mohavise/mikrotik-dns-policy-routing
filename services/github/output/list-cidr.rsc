# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# List: GitHub CIDR
# RouterOS address-list: DST-GITHUB-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-05 12:25:22 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GITHUB-TO-OUTBOUND comment="github-cidr"]
