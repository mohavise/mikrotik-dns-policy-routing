# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services CIDR
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-14 00:53:33 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-AWS-TO-OUTBOUND]
