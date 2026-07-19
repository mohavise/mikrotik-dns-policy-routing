# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# List: WhatsApp CIDR
# RouterOS address-list: DST-WHATSAPP-TO-OUTBOUND
# Source: manual verified additions
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WHATSAPP-TO-OUTBOUND]
