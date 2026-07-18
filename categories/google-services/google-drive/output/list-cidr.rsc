# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-drive
# List: Google Drive CIDR
# RouterOS address-list: DST-GOOGLE-DRIVE-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-18 00:56:22 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
