# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=package-repositories-to-outbound
# List: package repositories combined domains + CIDR
# RouterOS address-list: DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
# Last update: 2026-09-17 07:40:47 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
:do { add name="launchpadcontent.net" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:launchpadcontent.net" } on-error={}
:do { add name="ubuntu.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="ubuntu:ubuntu.com" } on-error={}

/ip firewall address-list
remove [find list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]

/ip dns static
:do { add name="debian.org" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="debian:debian.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="redhat.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:redhat.com" } on-error={}
:do { add name="redhat.io" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="redhat:redhat.io" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="proxmox.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="proxmox:proxmox.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="docker.com" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add name="docker.io" type=FWD match-subdomain=yes address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND comment="docker:docker.io" } on-error={}

/ip firewall address-list

