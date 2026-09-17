# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise combined domains + CIDR
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WISE-TO-OUTBOUND]
:do { add name="transferwise.com" type=FWD match-subdomain=yes address-list=DST-WISE-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add name="wise.com" type=FWD match-subdomain=yes address-list=DST-WISE-TO-OUTBOUND comment="wise:wise.com" } on-error={}

/ip firewall address-list
remove [find list=DST-WISE-TO-OUTBOUND]
