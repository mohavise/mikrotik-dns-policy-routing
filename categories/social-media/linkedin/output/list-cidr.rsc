# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# List: LinkedIn CIDR
# RouterOS address-list: DST-LINKEDIN-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-15 00:51:09 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-LINKEDIN-TO-OUTBOUND]
