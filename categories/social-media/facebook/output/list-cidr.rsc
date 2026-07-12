# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# List: Facebook CIDR
# RouterOS address-list: DST-FACEBOOK-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-12 01:05:04 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-FACEBOOK-TO-OUTBOUND]
