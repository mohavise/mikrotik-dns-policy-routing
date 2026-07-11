# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# List: Ubuntu combined domains + CIDR
# RouterOS address-list: DST-UBUNTU-TO-OUTBOUND
# Domain source: Ubuntu repository documentation (official-repository-domains)
# Last update: 2026-07-11 00:57:21 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-UBUNTU-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)archive\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:archive.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)changelogs\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:changelogs.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)esm\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:esm.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)keyserver\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:keyserver.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)packages\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:packages.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)ports\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:ports.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)ppa\\.launchpadcontent\\.net\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:ppa.launchpadcontent.net" } on-error={}
:do { add regexp="(^|.*\\.)security\\.ubuntu\\.com\$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:security.ubuntu.com" } on-error={}

/ip firewall address-list
remove [find list=DST-UBUNTU-TO-OUTBOUND]
