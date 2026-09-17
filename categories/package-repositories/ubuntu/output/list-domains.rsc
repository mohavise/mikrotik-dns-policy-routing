# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# List: Ubuntu domains
# RouterOS address-list: DST-UBUNTU-TO-OUTBOUND
# Source: Ubuntu repository documentation (official-repository-domains)
# Normalized source domain count: 8
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-UBUNTU-TO-OUTBOUND]
:do { add name="launchpadcontent.net" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:launchpadcontent.net" } on-error={}
:do { add name="ubuntu.com" type=FWD match-subdomain=yes address-list=DST-UBUNTU-TO-OUTBOUND comment="ubuntu:ubuntu.com" } on-error={}
