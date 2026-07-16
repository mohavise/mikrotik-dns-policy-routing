# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# List: Google Play CIDR
# RouterOS address-list: DST-GOOGLE-PLAY-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-16 00:56:31 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-PLAY-TO-OUTBOUND]
