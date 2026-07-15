# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=spotify
# List: Spotify CIDR
# RouterOS address-list: DST-SPOTIFY-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-15 00:51:08 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SPOTIFY-TO-OUTBOUND]
