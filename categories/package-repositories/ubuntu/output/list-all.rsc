# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# List: Ubuntu combined domains + CIDR
# RouterOS address-list: DST-UBUNTU-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-UBUNTU-TO-OUTBOUND]
:do { add list=DST-UBUNTU-TO-OUTBOUND address="launchpadcontent.net" comment="ubuntu:seed:launchpadcontent.net" } on-error={}
:do { add list=DST-UBUNTU-TO-OUTBOUND address="ubuntu.com" comment="ubuntu:seed:ubuntu.com" } on-error={}

/ip dns static
remove [find address-list=DST-UBUNTU-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)launchpadcontent\\.net$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:dns:launchpadcontent.net" } on-error={}
:do { add regexp="(^|.*\\.)ubuntu\\.com$" type=FWD address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:dns:ubuntu.com" } on-error={}

/ip firewall address-list
