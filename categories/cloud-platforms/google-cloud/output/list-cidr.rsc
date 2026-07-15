# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# List: Google Cloud CIDR
# RouterOS address-list: DST-GOOGLE-CLOUD-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-15 00:51:07 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
