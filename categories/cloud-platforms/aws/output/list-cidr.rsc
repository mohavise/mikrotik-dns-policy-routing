# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services CIDR
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-13 11:50:56 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-AWS-TO-OUTBOUND]
