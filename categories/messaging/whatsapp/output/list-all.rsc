# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# List: WhatsApp combined domains + CIDR
# RouterOS address-list: DST-WHATSAPP-TO-OUTBOUND
# Domain source: Meta-owned WhatsApp public domains (official-owned-domains)
# Last update: 2026-07-06 11:18:53 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WHATSAPP-TO-OUTBOUND comment~"whatsapp:"]
:do { add regexp="(^|.*\\.)wa\\.me\$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com\$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net\$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}

/ip firewall address-list
remove [find list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp-cidr"]
