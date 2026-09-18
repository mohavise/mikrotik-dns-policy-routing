# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=steam
# List: Steam CIDR
# RouterOS address-list: DST-STEAM-TO-OUTBOUND
# Source: Valve AS32590 announced IPv4 prefixes (asn-announced-prefixes)
# Source URL: https://stat.ripe.net/data/announced-prefixes/data.json?resource=AS32590
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-STEAM-TO-OUTBOUND]
:do { add list=DST-STEAM-TO-OUTBOUND address=103.10.124.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=103.10.125.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=103.28.54.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=146.66.152.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=146.66.155.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.224.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.225.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.226.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.227.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.228.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.229.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.230.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.231.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.236.0/23 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.238.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.239.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.240.0/23 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.244.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.246.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.248.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.249.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.250.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.251.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.252.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.254.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=155.133.255.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.192.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.193.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.194.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.195.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.196.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.197.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.198.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=162.254.199.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=185.25.180.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=185.25.182.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=185.25.183.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=192.69.96.0/22 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=205.196.6.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=208.64.200.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=208.64.201.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=208.64.202.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=208.64.203.0/24 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=208.78.164.0/22 comment="steam-cidr" } on-error={}
:do { add list=DST-STEAM-TO-OUTBOUND address=45.121.184.0/24 comment="steam-cidr" } on-error={}
