# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=financial-services-to-outbound
# List: financial services combined domains + CIDR
# RouterOS address-list: DST-FINANCIAL-SERVICES-TO-OUTBOUND
# Last update: 2026-09-18 08:20:07 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]
:do { add list=DST-FINANCIAL-SERVICES-TO-OUTBOUND address="transferwise.com" comment="wise:seed:transferwise.com" } on-error={}
:do { add list=DST-FINANCIAL-SERVICES-TO-OUTBOUND address="wise.com" comment="wise:seed:wise.com" } on-error={}

/ip dns static
remove [find address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)transferwise\\.com$" type=FWD address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND comment="wise:dns:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com$" type=FWD address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND comment="wise:dns:wise.com" } on-error={}

/ip firewall address-list

