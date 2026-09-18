# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=openai
# List: OpenAI CIDR
# RouterOS address-list: DST-OPENAI-TO-OUTBOUND
# Source: OpenAI ChatGPT Voice server IP ranges (official-service-feed)
# Source URL: https://openai.com/chatgpt-voice.json
# Normalized source CIDR count: 38
# Exact collapsed CIDR count: 38
# CIDRs are safely collapsed without adding addresses outside the source union
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-OPENAI-TO-OUTBOUND]
:do { add list=DST-OPENAI-TO-OUTBOUND address=4.151.200.38/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=4.155.146.196/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=4.197.172.116/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=4.217.235.100/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=4.245.198.13/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=13.71.25.29/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=20.74.221.21/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=20.162.96.163/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=20.168.48.117/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=20.184.36.134/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=20.203.144.245/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=40.118.236.137/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=51.4.112.173/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=52.143.181.161/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=68.155.152.41/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=72.146.20.246/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=74.248.148.7/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=102.37.57.54/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=103.21.244.0/22 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=103.22.200.0/22 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=103.31.4.0/22 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=104.16.0.0/13 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=104.24.0.0/14 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=108.162.192.0/18 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=131.0.72.0/22 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=135.220.40.201/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=141.101.64.0/18 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=162.158.0.0/15 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=172.64.0.0/13 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=172.203.39.49/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=172.207.173.200/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=172.214.226.198/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=173.245.48.0/20 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=188.114.96.0/20 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=190.93.240.0/20 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=191.233.251.27/32 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=197.234.240.0/22 comment="openai-cidr" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address=198.41.128.0/17 comment="openai-cidr" } on-error={}
