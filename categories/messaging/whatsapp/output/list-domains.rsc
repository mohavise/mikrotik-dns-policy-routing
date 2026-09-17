# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# List: WhatsApp domains
# RouterOS address-list: DST-WHATSAPP-TO-OUTBOUND
# Source: Meta-owned WhatsApp public domains (official-owned-domains)
# Normalized source domain count: 3
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
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
