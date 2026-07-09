# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# List: Apple App Store CIDR
# RouterOS address-list: DST-APPLE-APP-STORE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-09 10:40:39 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-APPLE-APP-STORE-TO-OUTBOUND]
