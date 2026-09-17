# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# List: Signal domains
# RouterOS address-list: DST-SIGNAL-TO-OUTBOUND
# Source: Signal-owned public domains (official-owned-domains)
# Normalized source domain count: 2
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SIGNAL-TO-OUTBOUND]
:do { add list=DST-SIGNAL-TO-OUTBOUND address="signal.me" comment="signal:seed:signal.me" } on-error={}
:do { add list=DST-SIGNAL-TO-OUTBOUND address="signal.org" comment="signal:seed:signal.org" } on-error={}

/ip dns static
remove [find address-list=DST-SIGNAL-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)signal\\.me$" type=FWD address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:dns:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org$" type=FWD address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:dns:signal.org" } on-error={}
