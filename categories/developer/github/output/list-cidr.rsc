# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# List: GitHub CIDR
# RouterOS address-list: DST-GITHUB-TO-OUTBOUND
# Source: GitHub official Meta API (official-api)
# Source URL: https://api.github.com/meta
# Normalized source CIDR count: 112
# Exact collapsed CIDR count: 75
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GITHUB-TO-OUTBOUND]
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.193/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.196/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.198/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.200/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.194/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.196/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.199/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.200/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.144/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.149/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.150/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.152/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.32/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.36/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.38/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.40/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.249.131.163/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.249.131.164/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.249.131.166/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.156.210/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.156.213/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.156.214/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.27.177.113/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.27.177.116/30 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.29.134.17/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.29.134.18/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.29.134.22/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.0/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.2/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.4/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.6/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.175.192.146/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.175.192.149/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.175.192.150/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.199.39.227/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.199.39.228/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.199.39.231/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.199.39.232/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.200.245.241/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.200.245.244/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.200.245.247/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.200.245.248/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.201.28.144/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.201.28.148/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.201.28.151/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.201.28.152/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.160/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.164/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.166/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.168/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.81/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.82/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.85/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.86/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.217.135.0/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.217.135.4/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.233.83.145/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.233.83.146/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.233.83.148/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.248.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.248.38/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.248.40/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.2/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.5/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.6/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.9/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=140.82.112.0/20 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=143.55.64.0/20 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.130/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.133/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.135/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.136/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=185.199.108.0/22 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=192.30.252.0/22 comment="github-cidr" } on-error={}
