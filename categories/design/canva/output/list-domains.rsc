# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# List: Canva domains
# RouterOS address-list: DST-CANVA-TO-OUTBOUND
# Source: Canva-owned public/service domains (official-owned-domains)
# Normalized source domain count: 2
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-CANVA-TO-OUTBOUND]
:do { add list=DST-CANVA-TO-OUTBOUND address="canva-apps.com" comment="canva:seed:canva-apps.com" } on-error={}
:do { add list=DST-CANVA-TO-OUTBOUND address="canva.com" comment="canva:seed:canva.com" } on-error={}

/ip dns static
remove [find address-list=DST-CANVA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)canva-apps\\.com$" type=FWD address-list=DST-CANVA-TO-OUTBOUND comment="canva:dns:canva-apps.com" } on-error={}
:do { add regexp="(^|.*\\.)canva\\.com$" type=FWD address-list=DST-CANVA-TO-OUTBOUND comment="canva:dns:canva.com" } on-error={}
