# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=financial-services-to-outbound
# List: financial services combined domains + CIDR
# RouterOS address-list: DST-FINANCIAL-SERVICES-TO-OUTBOUND
# Last update: 2026-07-19 14:07:18 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)transferwise\\.com\$" type=FWD address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com\$" type=FWD address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND comment="wise:wise.com" } on-error={}

/ip firewall address-list
remove [find list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]

