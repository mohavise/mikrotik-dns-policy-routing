# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# List: WhatsApp combined domains + CIDR
# RouterOS address-list: DST-WHATSAPP-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WHATSAPP-TO-OUTBOUND]
:do { add list=DST-WHATSAPP-TO-OUTBOUND address="wa.me" comment="whatsapp:seed:wa.me" } on-error={}
:do { add list=DST-WHATSAPP-TO-OUTBOUND address="whatsapp.com" comment="whatsapp:seed:whatsapp.com" } on-error={}
:do { add list=DST-WHATSAPP-TO-OUTBOUND address="whatsapp.net" comment="whatsapp:seed:whatsapp.net" } on-error={}

/ip dns static
remove [find address-list=DST-WHATSAPP-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)wa\\.me$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:dns:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:dns:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:dns:whatsapp.net" } on-error={}

/ip firewall address-list
