# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# List: WhatsApp domains
# RouterOS address-list: DST-WHATSAPP-TO-OUTBOUND
# Source: Meta-owned WhatsApp public domains (official-owned-domains)
# Last update: 2026-07-11 00:57:21 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WHATSAPP-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)wa\\.me\$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com\$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net\$" type=FWD address-list=DST-WHATSAPP-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}
