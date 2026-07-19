# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=youtube
# List: YouTube CIDR
# RouterOS address-list: DST-YOUTUBE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-19 01:01:56 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-YOUTUBE-TO-OUTBOUND]
