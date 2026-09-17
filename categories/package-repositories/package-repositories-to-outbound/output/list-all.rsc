# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=package-repositories-to-outbound
# List: package repositories combined domains + CIDR
# RouterOS address-list: DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
# Last update: 2026-09-17 07:10:49 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
:do { add name="archive.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:archive.ubuntu.com" } on-error={}
:do { add name="changelogs.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:changelogs.ubuntu.com" } on-error={}
:do { add name="esm.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:esm.ubuntu.com" } on-error={}
:do { add name="keyserver.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:keyserver.ubuntu.com" } on-error={}
:do { add name="packages.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:packages.ubuntu.com" } on-error={}
:do { add name="ports.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:ports.ubuntu.com" } on-error={}
:do { add name="ppa.launchpadcontent.net" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:ppa.launchpadcontent.net" } on-error={}
:do { add name="security.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:security.ubuntu.com" } on-error={}

/ip firewall address-list
remove [find list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]

/ip dns static
:do { add name="deb.debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:deb.debian.org" } on-error={}
:do { add name="ftp-master.debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:ftp-master.debian.org" } on-error={}
:do { add name="ftp.debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:ftp.debian.org" } on-error={}
:do { add name="packages.debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:packages.debian.org" } on-error={}
:do { add name="security.debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:security.debian.org" } on-error={}
:do { add name="snapshot.debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:snapshot.debian.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="access.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:access.redhat.com" } on-error={}
:do { add name="cdn.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:cdn.redhat.com" } on-error={}
:do { add name="cloud.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:cloud.redhat.com" } on-error={}
:do { add name="console.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:console.redhat.com" } on-error={}
:do { add name="registry.access.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:registry.access.redhat.com" } on-error={}
:do { add name="registry.redhat.io" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:registry.redhat.io" } on-error={}
:do { add name="sso.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:sso.redhat.com" } on-error={}
:do { add name="subscription.rhn.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:subscription.rhn.redhat.com" } on-error={}
:do { add name="subscription.rhsm.redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:subscription.rhsm.redhat.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="download.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:download.proxmox.com" } on-error={}
:do { add name="enterprise.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:enterprise.proxmox.com" } on-error={}
:do { add name="pbs.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:pbs.proxmox.com" } on-error={}
:do { add name="pve.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:pve.proxmox.com" } on-error={}
:do { add name="shop.proxmox.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:shop.proxmox.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="api.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:api.docker.com" } on-error={}
:do { add name="auth.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:auth.docker.com" } on-error={}
:do { add name="auth.docker.io" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:auth.docker.io" } on-error={}
:do { add name="desktop.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:desktop.docker.com" } on-error={}
:do { add name="docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add name="docker.io" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docker.io" } on-error={}
:do { add name="docs.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docs.docker.com" } on-error={}
:do { add name="download.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:download.docker.com" } on-error={}
:do { add name="hub.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:hub.docker.com" } on-error={}
:do { add name="login.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:login.docker.com" } on-error={}
:do { add name="production.cloudfront.docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:production.cloudfront.docker.com" } on-error={}
:do { add name="registry-1.docker.io" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:registry-1.docker.io" } on-error={}

/ip firewall address-list

