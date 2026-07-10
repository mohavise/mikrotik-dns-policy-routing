# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# List: Signal combined domains + CIDR
# RouterOS address-list: DST-SIGNAL-TO-OUTBOUND
# Domain source: Signal-owned public domains (official-owned-domains)
# Last update: 2026-07-10 10:38:31 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SIGNAL-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)signal\\.me\$" type=FWD address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org\$" type=FWD address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:signal.org" } on-error={}

/ip firewall address-list
remove [find list=DST-SIGNAL-TO-OUTBOUND]
