# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian combined domains + CIDR
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DEBIAN-TO-OUTBOUND]
:do { add list=DST-DEBIAN-TO-OUTBOUND address="debian.org" comment="debian:seed:debian.org" } on-error={}

/ip dns static
remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)debian\\.org$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:dns:debian.org" } on-error={}

/ip firewall address-list
