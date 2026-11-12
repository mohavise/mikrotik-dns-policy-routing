# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# List: GitHub combined domains + CIDR
# RouterOS address-list: DST-GITHUB-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GITHUB-TO-OUTBOUND]
:do { add list=DST-GITHUB-TO-OUTBOUND address="github.com" comment="github:seed:github.com" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="github.dev" comment="github:seed:github.dev" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="github.io" comment="github:seed:github.io" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="githubapp.com" comment="github:seed:githubapp.com" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="githubassets.com" comment="github:seed:githubassets.com" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="githubcopilot.com" comment="github:seed:githubcopilot.com" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="githubstatus.com" comment="github:seed:githubstatus.com" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address="githubusercontent.com" comment="github:seed:githubusercontent.com" } on-error={}

/ip dns static
remove [find address-list=DST-GITHUB-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)github\\.com$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:dns:githubusercontent.com" } on-error={}

/ip firewall address-list
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.149.173.80/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.159.108.160/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.159.197.192/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.163.8.144/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.186.157.192/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.187.247.160/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.195.217.80/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.196.32.112/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.207.215.240/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.193/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.196/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.198/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.208.26.200/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.209.111.112/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.209.112.0/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.194/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.196/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.199/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.11.200/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.187.240/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.225.189.240/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.144/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.149/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.150/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.228.31.152/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.234.31.32/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.236.95.112/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.32/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.36/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.38/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.237.22.40/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.249.131.163/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.249.131.164/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=4.249.131.166/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.6.7.16/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.58.32/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.68.64/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.156.210/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.156.213/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.26.156.214/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.27.163.208/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.27.177.113/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.27.177.116/30 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.29.134.17/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.29.134.18/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.29.134.22/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.0/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.2/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.4/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.87.245.6/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.169.109.160/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.172.24.160/28 comment="github-cidr" } on-error={}
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
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.160/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.164/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.166/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.205.243.168/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.81/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.82/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.85/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.207.73.86/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.208.89.80/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.217.135.0/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.217.135.4/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.233.83.145/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.233.83.146/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.233.83.148/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.247.166.64/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.250.119.67/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.250.119.68/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=20.250.119.72/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=40.121.125.32/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=40.121.125.128/26 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=40.121.125.192/27 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.200.82.112/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.10.80/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.248.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.248.38/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.202.248.40/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.2/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.5/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.6/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=48.204.201.9/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=57.155.223.240/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=74.161.79.192/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=135.235.149.144/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=140.82.112.0/20 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=143.55.64.0/20 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.130.18.192/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.130.45.112/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.130.153.16/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.130.201.80/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.139.64.112/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.130/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.133/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.135/32 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.182.252.136/31 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.194.155.208/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=172.194.218.192/28 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=185.199.108.0/22 comment="github-cidr" } on-error={}
:do { add list=DST-GITHUB-TO-OUTBOUND address=192.30.252.0/22 comment="github-cidr" } on-error={}
