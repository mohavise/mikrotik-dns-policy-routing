# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# List: Speedtest CIDR
# RouterOS address-list: SPEEDTEST
# Source: manual verified additions
# Normalized source CIDR count: 15
# Exact collapsed CIDR count: 15
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=SPEEDTEST]
:do { add list=SPEEDTEST address=103.21.244.0/22 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=103.22.200.0/22 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=103.31.4.0/22 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=104.16.0.0/13 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=104.24.0.0/14 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=108.162.192.0/18 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=131.0.72.0/22 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=141.101.64.0/18 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=162.158.0.0/15 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=172.64.0.0/13 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=173.245.48.0/20 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=188.114.96.0/20 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=190.93.240.0/20 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=197.234.240.0/22 comment="speedtest-cidr" } on-error={}
:do { add list=SPEEDTEST address=198.41.128.0/17 comment="speedtest-cidr" } on-error={}
