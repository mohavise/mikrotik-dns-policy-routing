# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian domains
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# Source: Debian mirror documentation (official-repository-domains)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
:do { add name="deb.debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:deb.debian.org" } on-error={}
:do { add name="ftp-master.debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:ftp-master.debian.org" } on-error={}
:do { add name="ftp.debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:ftp.debian.org" } on-error={}
:do { add name="packages.debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:packages.debian.org" } on-error={}
:do { add name="security.debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:security.debian.org" } on-error={}
:do { add name="snapshot.debian.org" type=FWD match-subdomain=yes address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:snapshot.debian.org" } on-error={}
