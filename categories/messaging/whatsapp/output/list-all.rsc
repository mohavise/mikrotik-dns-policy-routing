# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# List: WhatsApp combined domains + CIDR
# RouterOS address-list: DST-WHATSAPP-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WHATSAPP-TO-OUTBOUND]
:do { add name="wa.me" type=FWD match-subdomain=yes address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add name="whatsapp.com" type=FWD match-subdomain=yes address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add name="whatsapp.net" type=FWD match-subdomain=yes address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}

/ip firewall address-list
remove [find list=DST-WHATSAPP-TO-OUTBOUND]
