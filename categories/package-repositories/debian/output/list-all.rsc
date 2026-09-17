# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian combined domains + CIDR
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
:do { add name="debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:debian.org" } on-error={}

/ip firewall address-list
remove [find list=DST-DEBIAN-TO-OUTBOUND]
