# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian domains
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# Source: Debian mirror documentation (official-repository-domains)
# Normalized source domain count: 6
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
:do { add name="debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:debian.org" } on-error={}
