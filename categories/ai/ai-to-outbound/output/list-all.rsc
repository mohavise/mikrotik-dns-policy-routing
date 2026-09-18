# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=ai-to-outbound
# List: ai combined domains + CIDR
# RouterOS address-list: DST-AI-TO-OUTBOUND
# Last update: 2026-09-18 08:58:52 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-AI-TO-OUTBOUND]
:do { add list=DST-AI-TO-OUTBOUND address="apple.com" comment="openai:seed:apple.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="browser-intake-datadoghq.com" comment="openai:seed:browser-intake-datadoghq.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="chatgpt.com" comment="openai:seed:chatgpt.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="cloudflare.com" comment="openai:seed:cloudflare.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="imgix.net" comment="openai:seed:imgix.net" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="intercom.io" comment="openai:seed:intercom.io" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="intercomcdn.com" comment="openai:seed:intercomcdn.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="oaistatic.com" comment="openai:seed:oaistatic.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="oaistatsig.com" comment="openai:seed:oaistatsig.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="oaiusercontent.com" comment="openai:seed:oaiusercontent.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="openai.com" comment="openai:seed:openai.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="openaimerge.com" comment="openai:seed:openaimerge.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="sendgrid.net" comment="openai:seed:sendgrid.net" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="sentry.io" comment="openai:seed:sentry.io" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="stripe.com" comment="openai:seed:stripe.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="workos.com" comment="openai:seed:workos.com" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address="workoscdn.com" comment="openai:seed:workoscdn.com" } on-error={}

/ip dns static
remove [find address-list=DST-AI-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)apple\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:apple.com" } on-error={}
:do { add regexp="(^|.*\\.)browser-intake-datadoghq\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:browser-intake-datadoghq.com" } on-error={}
:do { add regexp="(^|.*\\.)chatgpt\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:chatgpt.com" } on-error={}
:do { add regexp="(^|.*\\.)cloudflare\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)imgix\\.net$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:imgix.net" } on-error={}
:do { add regexp="(^|.*\\.)intercom\\.io$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:intercom.io" } on-error={}
:do { add regexp="(^|.*\\.)intercomcdn\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:intercomcdn.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatic\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:oaistatic.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatsig\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:oaistatsig.com" } on-error={}
:do { add regexp="(^|.*\\.)oaiusercontent\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:oaiusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)openai\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:openai.com" } on-error={}
:do { add regexp="(^|.*\\.)openaimerge\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:openaimerge.com" } on-error={}
:do { add regexp="(^|.*\\.)sendgrid\\.net$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:sendgrid.net" } on-error={}
:do { add regexp="(^|.*\\.)sentry\\.io$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)stripe\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:stripe.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:workos.com" } on-error={}
:do { add regexp="(^|.*\\.)workoscdn\\.com$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:dns:workoscdn.com" } on-error={}

/ip firewall address-list
:do { add list=DST-AI-TO-OUTBOUND address=102.37.57.54/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=13.71.25.29/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=135.220.40.201/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=172.203.39.49/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=172.207.173.200/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=172.214.226.198/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=191.233.251.27/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=20.162.96.163/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=20.168.48.117/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=20.184.36.134/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=20.203.144.245/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=20.74.221.21/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=4.151.200.38/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=4.155.146.196/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=4.197.172.116/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=4.217.235.100/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=4.245.198.13/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=40.118.236.137/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=51.4.112.173/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=52.143.181.161/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=68.155.152.41/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=72.146.20.246/32 comment="openai-cidr" } on-error={}
:do { add list=DST-AI-TO-OUTBOUND address=74.248.148.7/32 comment="openai-cidr" } on-error={}

