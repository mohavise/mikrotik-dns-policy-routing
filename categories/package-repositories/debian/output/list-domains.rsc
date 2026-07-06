# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# List: Debian domains
# RouterOS address-list: DST-DEBIAN-TO-OUTBOUND
# Source: Debian mirror documentation (official-repository-domains)
# Last update: 2026-07-06 16:06:42 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)deb\\.debian\\.org\$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:deb.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)ftp-master\\.debian\\.org\$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:ftp-master.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)ftp\\.debian\\.org\$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:ftp.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)packages\\.debian\\.org\$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:packages.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)security\\.debian\\.org\$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:security.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)snapshot\\.debian\\.org\$" type=FWD address-list=DST-DEBIAN-TO-OUTBOUND comment="debian:snapshot.debian.org" } on-error={}
