# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise combined domains + CIDR
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# Domain source: Wise official production domains (official-owned-domains)
# Last update: 2026-07-19 01:01:56 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WISE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)transferwise\\.com\$" type=FWD address-list=DST-WISE-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com\$" type=FWD address-list=DST-WISE-TO-OUTBOUND comment="wise:wise.com" } on-error={}

/ip firewall address-list
remove [find list=DST-WISE-TO-OUTBOUND]
