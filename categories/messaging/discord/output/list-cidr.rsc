# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# List: Discord CIDR
# RouterOS address-list: DST-DISCORD-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-17 01:02:08 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DISCORD-TO-OUTBOUND]
