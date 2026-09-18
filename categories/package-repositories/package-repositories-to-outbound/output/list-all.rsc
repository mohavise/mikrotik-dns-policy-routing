# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=package-repositories-to-outbound
# List: package repositories combined domains + CIDR
# RouterOS address-list: DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
# Last update: 2026-09-18 08:21:50 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="launchpadcontent.net" comment="ubuntu:seed:launchpadcontent.net" } on-error={}
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="ubuntu.com" comment="ubuntu:seed:ubuntu.com" } on-error={}

/ip dns static
remove [find address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)launchpadcontent\\.net$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:dns:launchpadcontent.net" } on-error={}
:do { add regexp="(^|.*\\.)ubuntu\\.com$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:dns:ubuntu.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="debian.org" comment="debian:seed:debian.org" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)debian\\.org$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:dns:debian.org" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="redhat.com" comment="redhat:seed:redhat.com" } on-error={}
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="redhat.io" comment="redhat:seed:redhat.io" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)redhat\\.com$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:dns:redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)redhat\\.io$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:dns:redhat.io" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="proxmox.com" comment="proxmox:seed:proxmox.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)proxmox\\.com$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:dns:proxmox.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="docker.com" comment="docker:seed:docker.com" } on-error={}
:do { add list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND address="docker.io" comment="docker:seed:docker.io" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)docker\\.com$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:dns:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io$" type=FWD address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:dns:docker.io" } on-error={}

/ip firewall address-list

