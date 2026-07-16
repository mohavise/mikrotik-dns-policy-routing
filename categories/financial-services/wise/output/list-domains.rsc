# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise domains
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# Source: Wise official production domains (official-owned-domains)
# Last update: 2026-07-16 00:56:31 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WISE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)transferwise\\.com\$" type=FWD address-list=DST-WISE-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com\$" type=FWD address-list=DST-WISE-TO-OUTBOUND comment="wise:wise.com" } on-error={}
