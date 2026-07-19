# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# List: Discord CIDR
# RouterOS address-list: DST-DISCORD-TO-OUTBOUND
# Source: manual verified additions
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DISCORD-TO-OUTBOUND]
