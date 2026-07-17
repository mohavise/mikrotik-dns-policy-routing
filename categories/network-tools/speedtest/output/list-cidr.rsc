# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# List: Speedtest CIDR
# RouterOS address-list: SPEEDTEST
# Source: manual verified additions
# Last update: 2026-07-17 01:02:10 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=SPEEDTEST]
