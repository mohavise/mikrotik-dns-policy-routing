# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat CIDR
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-19 01:01:57 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-REDHAT-TO-OUTBOUND]
