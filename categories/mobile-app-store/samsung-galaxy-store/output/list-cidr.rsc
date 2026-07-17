# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# List: Samsung Galaxy Store CIDR
# RouterOS address-list: DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-17 01:02:10 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
