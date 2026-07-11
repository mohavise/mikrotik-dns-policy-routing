# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# List: Canva combined domains + CIDR
# RouterOS address-list: DST-CANVA-TO-OUTBOUND
# Domain source: Canva-owned public/service domains (official-owned-domains)
# Last update: 2026-07-11 00:57:20 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-CANVA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)canva-apps\\.com\$" type=FWD address-list=DST-CANVA-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}
:do { add regexp="(^|.*\\.)canva\\.com\$" type=FWD address-list=DST-CANVA-TO-OUTBOUND comment="canva:canva.com" } on-error={}

/ip firewall address-list
remove [find list=DST-CANVA-TO-OUTBOUND]
