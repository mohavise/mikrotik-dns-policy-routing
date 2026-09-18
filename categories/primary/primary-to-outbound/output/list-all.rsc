# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=primary-to-outbound
# List: Primary combined domains + CIDR
# RouterOS address-list: DST-TO-OUTBOUND
# Last update: 2026-09-18 08:21:50 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND]
:do { add list=DST-TO-OUTBOUND address="apple.com" comment="openai:seed:apple.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="browser-intake-datadoghq.com" comment="openai:seed:browser-intake-datadoghq.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="chatgpt.com" comment="openai:seed:chatgpt.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="cloudflare.com" comment="openai:seed:cloudflare.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="imgix.net" comment="openai:seed:imgix.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="intercom.io" comment="openai:seed:intercom.io" } on-error={}
:do { add list=DST-TO-OUTBOUND address="intercomcdn.com" comment="openai:seed:intercomcdn.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="oaistatic.com" comment="openai:seed:oaistatic.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="oaistatsig.com" comment="openai:seed:oaistatsig.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="oaiusercontent.com" comment="openai:seed:oaiusercontent.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="openai.com" comment="openai:seed:openai.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="openaimerge.com" comment="openai:seed:openaimerge.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="sendgrid.net" comment="openai:seed:sendgrid.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="sentry.io" comment="openai:seed:sentry.io" } on-error={}
:do { add list=DST-TO-OUTBOUND address="stripe.com" comment="openai:seed:stripe.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="workos.com" comment="openai:seed:workos.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="workoscdn.com" comment="openai:seed:workoscdn.com" } on-error={}

/ip dns static
remove [find address-list=DST-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)apple\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:apple.com" } on-error={}
:do { add regexp="(^|.*\\.)browser-intake-datadoghq\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:browser-intake-datadoghq.com" } on-error={}
:do { add regexp="(^|.*\\.)chatgpt\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:chatgpt.com" } on-error={}
:do { add regexp="(^|.*\\.)cloudflare\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)imgix\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:imgix.net" } on-error={}
:do { add regexp="(^|.*\\.)intercom\\.io$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:intercom.io" } on-error={}
:do { add regexp="(^|.*\\.)intercomcdn\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:intercomcdn.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatic\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:oaistatic.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatsig\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:oaistatsig.com" } on-error={}
:do { add regexp="(^|.*\\.)oaiusercontent\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:oaiusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)openai\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:openai.com" } on-error={}
:do { add regexp="(^|.*\\.)openaimerge\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:openaimerge.com" } on-error={}
:do { add regexp="(^|.*\\.)sendgrid\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:sendgrid.net" } on-error={}
:do { add regexp="(^|.*\\.)sentry\\.io$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)stripe\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:stripe.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:workos.com" } on-error={}
:do { add regexp="(^|.*\\.)workoscdn\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:dns:workoscdn.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="a2z.com" comment="aws:seed:a2z.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="amazon.com" comment="aws:seed:amazon.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="amazonaws.com" comment="aws:seed:amazonaws.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="awsstatic.com" comment="aws:seed:awsstatic.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="signin.aws" comment="aws:seed:signin.aws" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)a2z\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:dns:a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)amazon\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:dns:amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)amazonaws\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:dns:amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:dns:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:dns:signin.aws" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="google.com" comment="google-cloud:seed:google.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="googleapis.com" comment="google-cloud:seed:googleapis.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="gstatic.com" comment="google-cloud:seed:gstatic.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="withgoogle.com" comment="google-cloud:seed:withgoogle.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:dns:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)withgoogle\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:dns:withgoogle.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="azure.com" comment="microsoft-azure:seed:azure.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="azure.net" comment="microsoft-azure:seed:azure.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="live.com" comment="microsoft-azure:seed:live.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="microsoft.com" comment="microsoft-azure:seed:microsoft.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="microsoftonline-p.com" comment="microsoft-azure:seed:microsoftonline-p.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="microsoftonline.com" comment="microsoft-azure:seed:microsoftonline.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="msauth.net" comment="microsoft-azure:seed:msauth.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="msauthimages.net" comment="microsoft-azure:seed:msauthimages.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="msftauth.net" comment="microsoft-azure:seed:msftauth.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="msftauthimages.net" comment="microsoft-azure:seed:msftauthimages.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="windows.net" comment="microsoft-azure:seed:windows.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)azure\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:azure.com" } on-error={}
:do { add regexp="(^|.*\\.)azure\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:azure.net" } on-error={}
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline-p\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:microsoftonline-p.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msauthimages\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:msauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauthimages\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:msftauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)windows\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:dns:windows.net" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="github.com" comment="github:seed:github.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="github.dev" comment="github:seed:github.dev" } on-error={}
:do { add list=DST-TO-OUTBOUND address="github.io" comment="github:seed:github.io" } on-error={}
:do { add list=DST-TO-OUTBOUND address="githubapp.com" comment="github:seed:githubapp.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="githubassets.com" comment="github:seed:githubassets.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="githubcopilot.com" comment="github:seed:githubcopilot.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="githubstatus.com" comment="github:seed:githubstatus.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="githubusercontent.com" comment="github:seed:githubusercontent.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)github\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="github:dns:githubusercontent.com" } on-error={}

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address=140.82.112.0/20 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.112.33/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.112.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.113.33/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.113.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.114.33/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.114.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.121.33/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=140.82.121.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=143.55.64.0/20 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=172.182.252.130/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=172.182.252.133/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=172.182.252.135/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=172.182.252.136/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=172.182.252.137/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.199.108.0/22 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.199.108.153/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.199.109.153/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.199.110.153/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.199.111.153/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=192.30.252.0/22 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=192.30.252.153/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=192.30.252.154/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=192.30.255.164/31 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.175.192.146/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.175.192.147/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.175.192.149/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.175.192.150/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.199.39.227/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.199.39.228/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.199.39.231/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.199.39.232/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.200.245.241/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.200.245.244/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.200.245.245/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.200.245.247/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.200.245.248/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.201.28.144/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.201.28.148/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.201.28.151/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.201.28.152/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.205.243.160/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.205.243.161/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.205.243.164/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.205.243.166/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.205.243.168/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.207.73.81/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.207.73.82/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.207.73.83/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.207.73.85/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.207.73.86/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.217.135.0/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.217.135.1/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.217.135.4/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.217.135.5/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.233.83.145/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.233.83.146/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.233.83.147/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.233.83.148/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.233.83.149/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.26.156.210/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.26.156.211/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.26.156.213/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.26.156.214/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.26.156.215/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.27.177.113/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.27.177.116/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.27.177.117/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.27.177.118/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.27.177.119/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.29.134.17/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.29.134.18/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.29.134.19/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.29.134.22/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.29.134.23/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.87.245.0/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.87.245.1/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.87.245.2/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.87.245.4/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.87.245.6/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.208.26.193/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.208.26.196/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.208.26.197/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.208.26.198/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.208.26.200/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.225.11.194/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.225.11.196/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.225.11.199/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.225.11.200/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.225.11.201/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.228.31.144/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.228.31.145/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.228.31.149/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.228.31.150/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.228.31.152/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.237.22.32/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.237.22.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.237.22.36/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.237.22.38/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.237.22.40/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.249.131.163/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.249.131.164/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.249.131.166/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=4.249.131.167/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.202.248.34/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.202.248.38/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.202.248.39/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.202.248.40/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.204.201.2/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.204.201.5/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.204.201.6/32 comment="github-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=48.204.201.9/32 comment="github-cidr" } on-error={}


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="figma.com" comment="figma:seed:figma.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="figma.net" comment="figma:seed:figma.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="figma.site" comment="figma:seed:figma.site" } on-error={}
:do { add list=DST-TO-OUTBOUND address="figmausercontent.com" comment="figma:seed:figmausercontent.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)figma\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:dns:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:dns:figma.net" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.site$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:dns:figma.site" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:dns:figmausercontent.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="canva-apps.com" comment="canva:seed:canva-apps.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="canva.com" comment="canva:seed:canva.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)canva-apps\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="canva:dns:canva-apps.com" } on-error={}
:do { add regexp="(^|.*\\.)canva\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="canva:dns:canva.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="transferwise.com" comment="wise:seed:transferwise.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="wise.com" comment="wise:seed:wise.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)transferwise\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="wise:dns:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="wise:dns:wise.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="googleusercontent.com" comment="google-drive:seed:googleusercontent.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)googleusercontent\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:dns:googleusercontent.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="ggpht.com" comment="youtube:seed:ggpht.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="googlevideo.com" comment="youtube:seed:googlevideo.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="youtu.be" comment="youtube:seed:youtu.be" } on-error={}
:do { add list=DST-TO-OUTBOUND address="youtube-nocookie.com" comment="youtube:seed:youtube-nocookie.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="youtube.com" comment="youtube:seed:youtube.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="ytimg.com" comment="youtube:seed:ytimg.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)ggpht\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:dns:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)googlevideo\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:dns:googlevideo.com" } on-error={}
:do { add regexp="(^|.*\\.)youtu\\.be$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:dns:youtu.be" } on-error={}
:do { add regexp="(^|.*\\.)youtube-nocookie\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:dns:youtube-nocookie.com" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:dns:youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)ytimg\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:dns:ytimg.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="akamaihd.net" comment="steam:seed:akamaihd.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steam-chat.com" comment="steam:seed:steam-chat.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steam.tv" comment="steam:seed:steam.tv" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steamcommunity.com" comment="steam:seed:steamcommunity.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steamcontent.com" comment="steam:seed:steamcontent.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steamgames.com" comment="steam:seed:steamgames.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steampowered.com" comment="steam:seed:steampowered.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steamserver.net" comment="steam:seed:steamserver.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steamstatic.com" comment="steam:seed:steamstatic.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="steamusercontent.com" comment="steam:seed:steamusercontent.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="valvesoftware.com" comment="steam:seed:valvesoftware.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)akamaihd\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)steam-chat\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steam-chat.com" } on-error={}
:do { add regexp="(^|.*\\.)steam\\.tv$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steam.tv" } on-error={}
:do { add regexp="(^|.*\\.)steamcommunity\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steamcommunity.com" } on-error={}
:do { add regexp="(^|.*\\.)steamcontent\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steamcontent.com" } on-error={}
:do { add regexp="(^|.*\\.)steamgames\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steamgames.com" } on-error={}
:do { add regexp="(^|.*\\.)steampowered\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)steamserver\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steamserver.net" } on-error={}
:do { add regexp="(^|.*\\.)steamstatic\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steamstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)steamusercontent\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:steamusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)valvesoftware\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:dns:valvesoftware.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="cdn-telegram.org" comment="telegram:seed:cdn-telegram.org" } on-error={}
:do { add list=DST-TO-OUTBOUND address="comments.app" comment="telegram:seed:comments.app" } on-error={}
:do { add list=DST-TO-OUTBOUND address="contest.com" comment="telegram:seed:contest.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="fragment.com" comment="telegram:seed:fragment.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="graph.org" comment="telegram:seed:graph.org" } on-error={}
:do { add list=DST-TO-OUTBOUND address="quiz.directory" comment="telegram:seed:quiz.directory" } on-error={}
:do { add list=DST-TO-OUTBOUND address="t.me" comment="telegram:seed:t.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="tdesktop.com" comment="telegram:seed:tdesktop.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telega.one" comment="telegram:seed:telega.one" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telegra.ph" comment="telegram:seed:telegra.ph" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telegram-cdn.org" comment="telegram:seed:telegram-cdn.org" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telegram.dog" comment="telegram:seed:telegram.dog" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telegram.me" comment="telegram:seed:telegram.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telegram.org" comment="telegram:seed:telegram.org" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telegram.space" comment="telegram:seed:telegram.space" } on-error={}
:do { add list=DST-TO-OUTBOUND address="telesco.pe" comment="telegram:seed:telesco.pe" } on-error={}
:do { add list=DST-TO-OUTBOUND address="tg.dev" comment="telegram:seed:tg.dev" } on-error={}
:do { add list=DST-TO-OUTBOUND address="ton.org" comment="telegram:seed:ton.org" } on-error={}
:do { add list=DST-TO-OUTBOUND address="toncenter.com" comment="telegram:seed:toncenter.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="tx.me" comment="telegram:seed:tx.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="usercontent.dev" comment="telegram:seed:usercontent.dev" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)cdn-telegram\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:cdn-telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)comments\\.app$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:comments.app" } on-error={}
:do { add regexp="(^|.*\\.)contest\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:contest.com" } on-error={}
:do { add regexp="(^|.*\\.)fragment\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:fragment.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:graph.org" } on-error={}
:do { add regexp="(^|.*\\.)quiz\\.directory$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:quiz.directory" } on-error={}
:do { add regexp="(^|.*\\.)t\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:t.me" } on-error={}
:do { add regexp="(^|.*\\.)tdesktop\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:tdesktop.com" } on-error={}
:do { add regexp="(^|.*\\.)telega\\.one$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telega.one" } on-error={}
:do { add regexp="(^|.*\\.)telegra\\.ph$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telegra.ph" } on-error={}
:do { add regexp="(^|.*\\.)telegram-cdn\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telegram-cdn.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.dog$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telegram.dog" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telegram.me" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.space$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telegram.space" } on-error={}
:do { add regexp="(^|.*\\.)telesco\\.pe$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:telesco.pe" } on-error={}
:do { add regexp="(^|.*\\.)tg\\.dev$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:tg.dev" } on-error={}
:do { add regexp="(^|.*\\.)ton\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:ton.org" } on-error={}
:do { add regexp="(^|.*\\.)toncenter\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:toncenter.com" } on-error={}
:do { add regexp="(^|.*\\.)tx\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:tx.me" } on-error={}
:do { add regexp="(^|.*\\.)usercontent\\.dev$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:dns:usercontent.dev" } on-error={}

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.12.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.16.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.20.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.8.0/22 comment="telegram-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="wa.me" comment="whatsapp:seed:wa.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="whatsapp.com" comment="whatsapp:seed:whatsapp.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="whatsapp.net" comment="whatsapp:seed:whatsapp.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)wa\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:dns:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:dns:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:dns:whatsapp.net" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="signal.me" comment="signal:seed:signal.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="signal.org" comment="signal:seed:signal.org" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)signal\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="signal:dns:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="signal:dns:signal.org" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="discord.com" comment="discord:seed:discord.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="discord.gg" comment="discord:seed:discord.gg" } on-error={}
:do { add list=DST-TO-OUTBOUND address="discordapp.com" comment="discord:seed:discordapp.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="discordapp.net" comment="discord:seed:discordapp.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)discord\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="discord:dns:discord.com" } on-error={}
:do { add regexp="(^|.*\\.)discord\\.gg$" type=FWD address-list=DST-TO-OUTBOUND comment="discord:dns:discord.gg" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="discord:dns:discordapp.com" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="discord:dns:discordapp.net" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="microsoft365.com" comment="microsoft-365:seed:microsoft365.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="msocdn.com" comment="microsoft-365:seed:msocdn.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="office.com" comment="microsoft-365:seed:office.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="office.net" comment="microsoft-365:seed:office.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="office365.com" comment="microsoft-365:seed:office365.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="outlook.com" comment="microsoft-365:seed:outlook.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="sharepoint.com" comment="microsoft-365:seed:sharepoint.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)microsoft365\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:microsoft365.com" } on-error={}
:do { add regexp="(^|.*\\.)msocdn\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:msocdn.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:office.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:office.net" } on-error={}
:do { add regexp="(^|.*\\.)office365\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:office365.com" } on-error={}
:do { add regexp="(^|.*\\.)outlook\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:outlook.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:dns:sharepoint.com" } on-error={}

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address=104.146.128.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=104.47.0.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.128.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.136.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.140.6/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.18.10/31 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.18.15/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.6.152/31 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.6.171/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.6.192/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=13.107.9.192/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=131.253.33.215/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=132.245.0.0/16 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=150.171.32.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=150.171.40.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.190.128.0/18 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.20.32.0/19 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=20.231.128.0/19 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=204.79.197.215/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=23.103.160.0/20 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=40.104.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=40.107.0.0/16 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=40.108.128.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=40.126.0.0/18 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=40.92.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=40.96.0.0/13 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.100.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.104.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.108.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.112.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.122.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.238.78.88/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.244.37.168/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=52.96.0.0/14 comment="microsoft-365-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="1drv.com" comment="onedrive:seed:1drv.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="1drv.ms" comment="onedrive:seed:1drv.ms" } on-error={}
:do { add list=DST-TO-OUTBOUND address="onedrive.com" comment="onedrive:seed:onedrive.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)1drv\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:dns:1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)1drv\\.ms$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:dns:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:dns:onedrive.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="lync.com" comment="teams:seed:lync.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="sfbassets.com" comment="teams:seed:sfbassets.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="skype.com" comment="teams:seed:skype.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)lync\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:dns:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:dns:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:dns:skype.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="windowsupdate.com" comment="windows-update:seed:windowsupdate.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)windowsupdate\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:dns:windowsupdate.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="apple-cloudkit.com" comment="apple-app-store:seed:apple-cloudkit.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="mzstatic.com" comment="apple-app-store:seed:mzstatic.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="safebrowsing.apple" comment="apple-app-store:seed:safebrowsing.apple" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)apple-cloudkit\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:dns:apple-cloudkit.com" } on-error={}
:do { add regexp="(^|.*\\.)mzstatic\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:dns:mzstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)safebrowsing\\.apple$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:dns:safebrowsing.apple" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="android.com" comment="google-play:seed:android.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="google-analytics.com" comment="google-play:seed:google-analytics.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="gvt1.com" comment="google-play:seed:gvt1.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="gvt2.com" comment="google-play:seed:gvt2.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="gvt3.com" comment="google-play:seed:gvt3.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="pki.goog" comment="google-play:seed:pki.goog" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)android\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dns:android.com" } on-error={}
:do { add regexp="(^|.*\\.)google-analytics\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dns:google-analytics.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt1\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dns:gvt1.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt2\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dns:gvt2.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt3\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dns:gvt3.com" } on-error={}
:do { add regexp="(^|.*\\.)pki\\.goog$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dns:pki.goog" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="llnwd.net" comment="samsung-galaxy-store:seed:llnwd.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="ospserver.net" comment="samsung-galaxy-store:seed:ospserver.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="samsung.cn" comment="samsung-galaxy-store:seed:samsung.cn" } on-error={}
:do { add list=DST-TO-OUTBOUND address="samsung.com" comment="samsung-galaxy-store:seed:samsung.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="samsungapps.com" comment="samsung-galaxy-store:seed:samsungapps.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)llnwd\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:dns:llnwd.net" } on-error={}
:do { add regexp="(^|.*\\.)ospserver\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:dns:ospserver.net" } on-error={}
:do { add regexp="(^|.*\\.)samsung\\.cn$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsung.cn" } on-error={}
:do { add regexp="(^|.*\\.)samsung\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsung.com" } on-error={}
:do { add regexp="(^|.*\\.)samsungapps\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsungapps.com" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="akamaized.net" comment="spotify:seed:akamaized.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="pscdn.co" comment="spotify:seed:pscdn.co" } on-error={}
:do { add list=DST-TO-OUTBOUND address="scdn.co" comment="spotify:seed:scdn.co" } on-error={}
:do { add list=DST-TO-OUTBOUND address="spotify.com" comment="spotify:seed:spotify.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="spotifycdn.com" comment="spotify:seed:spotifycdn.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="spotifycdn.net" comment="spotify:seed:spotifycdn.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)akamaized\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:dns:akamaized.net" } on-error={}
:do { add regexp="(^|.*\\.)pscdn\\.co$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:dns:pscdn.co" } on-error={}
:do { add regexp="(^|.*\\.)scdn\\.co$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:dns:scdn.co" } on-error={}
:do { add regexp="(^|.*\\.)spotify\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:dns:spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:dns:spotifycdn.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:dns:spotifycdn.net" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="launchpadcontent.net" comment="ubuntu:seed:launchpadcontent.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="ubuntu.com" comment="ubuntu:seed:ubuntu.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)launchpadcontent\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:dns:launchpadcontent.net" } on-error={}
:do { add regexp="(^|.*\\.)ubuntu\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:dns:ubuntu.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="debian.org" comment="debian:seed:debian.org" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)debian\\.org$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:dns:debian.org" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="redhat.com" comment="redhat:seed:redhat.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="redhat.io" comment="redhat:seed:redhat.io" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)redhat\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:dns:redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)redhat\\.io$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:dns:redhat.io" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="proxmox.com" comment="proxmox:seed:proxmox.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)proxmox\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="proxmox:dns:proxmox.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="docker.com" comment="docker:seed:docker.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="docker.io" comment="docker:seed:docker.io" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)docker\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:dns:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:dns:docker.io" } on-error={}

/ip firewall address-list


/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="cdninstagram.com" comment="instagram:seed:cdninstagram.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="ig.me" comment="instagram:seed:ig.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="instagram.com" comment="instagram:seed:instagram.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)cdninstagram\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:dns:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:dns:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:dns:instagram.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="facebook.com" comment="facebook:seed:facebook.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="fb.com" comment="facebook:seed:fb.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="fbcdn.net" comment="facebook:seed:fbcdn.net" } on-error={}
:do { add list=DST-TO-OUTBOUND address="fbsbx.com" comment="facebook:seed:fbsbx.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="m.me" comment="facebook:seed:m.me" } on-error={}
:do { add list=DST-TO-OUTBOUND address="messenger.com" comment="facebook:seed:messenger.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)facebook\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:dns:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:dns:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:dns:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:dns:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:dns:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:dns:messenger.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="t.co" comment="x:seed:t.co" } on-error={}
:do { add list=DST-TO-OUTBOUND address="twimg.com" comment="x:seed:twimg.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="twitter.com" comment="x:seed:twitter.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="x.com" comment="x:seed:x.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)t\\.co$" type=FWD address-list=DST-TO-OUTBOUND comment="x:dns:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="x:dns:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="x:dns:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="x:dns:x.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="licdn.com" comment="linkedin:seed:licdn.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="linkedin.com" comment="linkedin:seed:linkedin.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="lnkd.in" comment="linkedin:seed:lnkd.in" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)licdn\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:dns:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:dns:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:dns:lnkd.in" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-TO-OUTBOUND address="redd.it" comment="reddit:seed:redd.it" } on-error={}
:do { add list=DST-TO-OUTBOUND address="reddit.com" comment="reddit:seed:reddit.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="redditmedia.com" comment="reddit:seed:redditmedia.com" } on-error={}
:do { add list=DST-TO-OUTBOUND address="redditstatic.com" comment="reddit:seed:redditstatic.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)redd\\.it$" type=FWD address-list=DST-TO-OUTBOUND comment="reddit:dns:redd.it" } on-error={}
:do { add regexp="(^|.*\\.)reddit\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="reddit:dns:reddit.com" } on-error={}
:do { add regexp="(^|.*\\.)redditmedia\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="reddit:dns:redditmedia.com" } on-error={}
:do { add regexp="(^|.*\\.)redditstatic\\.com$" type=FWD address-list=DST-TO-OUTBOUND comment="reddit:dns:redditstatic.com" } on-error={}

/ip firewall address-list


