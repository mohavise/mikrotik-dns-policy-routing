# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# List: Docker CIDR
# RouterOS address-list: DST-DOCKER-TO-OUTBOUND
# Source: manual verified additions
# Last update: 2026-07-09 10:40:39 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DOCKER-TO-OUTBOUND]
