# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=package-repositories-to-outbound
# List: package repositories combined domains + CIDR
# RouterOS address-list: DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
# Last update: 2026-07-19 14:07:18 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)archive\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:archive.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)changelogs\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:changelogs.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)esm\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:esm.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)keyserver\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:keyserver.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)packages\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:packages.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)ports\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:ports.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)ppa\\.launchpadcontent\\.net\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:ppa.launchpadcontent.net" } on-error={}
:do { add regexp="(^|.*\\.)security\\.ubuntu\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:security.ubuntu.com" } on-error={}

/ip firewall address-list
remove [find list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]

/ip dns static
:do { add regexp="(^|.*\\.)deb\\.debian\\.org\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:deb.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)ftp-master\\.debian\\.org\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:ftp-master.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)ftp\\.debian\\.org\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:ftp.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)packages\\.debian\\.org\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:packages.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)security\\.debian\\.org\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:security.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)snapshot\\.debian\\.org\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:snapshot.debian.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)access\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:access.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)cdn\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:cdn.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)cloud\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:cloud.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:console.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)registry\\.access\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:registry.access.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)registry\\.redhat\\.io\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:registry.redhat.io" } on-error={}
:do { add regexp="(^|.*\\.)sso\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:sso.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)subscription\\.rhn\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:subscription.rhn.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)subscription\\.rhsm\\.redhat\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:subscription.rhsm.redhat.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)download\\.proxmox\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:download.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)enterprise\\.proxmox\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:enterprise.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)pbs\\.proxmox\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:pbs.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)pve\\.proxmox\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:pve.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)shop\\.proxmox\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:shop.proxmox.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)api\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:api.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)auth\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:auth.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)auth\\.docker\\.io\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:auth.docker.io" } on-error={}
:do { add regexp="(^|.*\\.)desktop\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:desktop.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docker.io" } on-error={}
:do { add regexp="(^|.*\\.)docs\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docs.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:download.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)hub\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:hub.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:login.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)production\\.cloudfront\\.docker\\.com\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:production.cloudfront.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)registry-1\\.docker\\.io\$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:registry-1.docker.io" } on-error={}

/ip firewall address-list

