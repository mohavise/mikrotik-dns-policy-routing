# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# List: Wise domains
# RouterOS address-list: DST-WISE-TO-OUTBOUND
# Source: Wise official production domains (official-owned-domains)
# Normalized source domain count: 2
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WISE-TO-OUTBOUND]
:do { add list=DST-WISE-TO-OUTBOUND address="transferwise.com" comment="wise:seed:transferwise.com" } on-error={}
:do { add list=DST-WISE-TO-OUTBOUND address="wise.com" comment="wise:seed:wise.com" } on-error={}

/ip dns static
remove [find address-list=DST-WISE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)transferwise\\.com$" type=FWD address-list=DST-WISE-TO-OUTBOUND comment="wise:dns:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com$" type=FWD address-list=DST-WISE-TO-OUTBOUND comment="wise:dns:wise.com" } on-error={}
