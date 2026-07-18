# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# List: Signal domains
# RouterOS address-list: DST-SIGNAL-TO-OUTBOUND
# Source: Signal-owned public domains (official-owned-domains)
# Last update: 2026-07-18 00:56:22 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SIGNAL-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)signal\\.me\$" type=FWD address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org\$" type=FWD address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:signal.org" } on-error={}
