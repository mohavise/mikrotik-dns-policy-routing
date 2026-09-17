# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# List: Ubuntu combined domains + CIDR
# RouterOS address-list: DST-UBUNTU-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-UBUNTU-TO-OUTBOUND]
:do { add name="launchpadcontent.net" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:launchpadcontent.net" } on-error={}
:do { add name="ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:ubuntu.com" } on-error={}

/ip firewall address-list
remove [find list=DST-UBUNTU-TO-OUTBOUND]
