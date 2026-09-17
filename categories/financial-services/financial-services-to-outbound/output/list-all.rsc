# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=financial-services-to-outbound
# List: financial services combined domains + CIDR
# RouterOS address-list: DST-FINANCIAL-SERVICES-TO-OUTBOUND
# Last update: 2026-09-17 07:26:38 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]
:do { add name="transferwise.com" type=FWD match-subdomain=yes address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add name="wise.com" type=FWD match-subdomain=yes address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND comment="wise:wise.com" } on-error={}

/ip firewall address-list
remove [find list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]

