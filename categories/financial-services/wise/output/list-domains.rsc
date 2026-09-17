# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise domains
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# Source: Wise official production domains (official-owned-domains)
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WISE-TO-OUTBOUND]
:do { add name="transferwise.com" type=FWD match-subdomain=yes address-list=DST-WISE-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add name="wise.com" type=FWD match-subdomain=yes address-list=DST-WISE-TO-OUTBOUND comment="wise:wise.com" } on-error={}
