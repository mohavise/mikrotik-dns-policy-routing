# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian domains
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# Source: Debian mirror documentation (official-repository-domains)
# Normalized source domain count: 6
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DEBIAN-TO-OUTBOUND]
:do { add list=DST-DEBIAN-TO-OUTBOUND address="debian.org" comment="debian:seed:debian.org" } on-error={}

/ip dns static
remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)debian\\.org$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:dns:debian.org" } on-error={}
