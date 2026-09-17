# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# List: Signal domains
# RouterOS address-list: DST-SIGNAL-TO-OUTBOUND
# Source: Signal-owned public domains (official-owned-domains)
# Normalized source domain count: 2
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SIGNAL-TO-OUTBOUND]
:do { add name="signal.me" type=FWD match-subdomain=yes address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add name="signal.org" type=FWD match-subdomain=yes address-list=DST-SIGNAL-TO-OUTBOUND comment="signal:signal.org" } on-error={}
