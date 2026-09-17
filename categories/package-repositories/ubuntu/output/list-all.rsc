# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# List: Ubuntu combined domains + CIDR
# RouterOS address-list: DST-UBUNTU-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-UBUNTU-TO-OUTBOUND]
:do { add name="archive.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:archive.ubuntu.com" } on-error={}
:do { add name="changelogs.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:changelogs.ubuntu.com" } on-error={}
:do { add name="esm.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:esm.ubuntu.com" } on-error={}
:do { add name="keyserver.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:keyserver.ubuntu.com" } on-error={}
:do { add name="packages.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:packages.ubuntu.com" } on-error={}
:do { add name="ports.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:ports.ubuntu.com" } on-error={}
:do { add name="ppa.launchpadcontent.net" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:ppa.launchpadcontent.net" } on-error={}
:do { add name="security.ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:security.ubuntu.com" } on-error={}

/ip firewall address-list
remove [find list=DST-UBUNTU-TO-OUTBOUND]
