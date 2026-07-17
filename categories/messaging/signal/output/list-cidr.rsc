# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# List: Signal CIDR
# RouterOS address-list: DST-SIGNAL-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-17 01:02:08 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SIGNAL-TO-OUTBOUND]
