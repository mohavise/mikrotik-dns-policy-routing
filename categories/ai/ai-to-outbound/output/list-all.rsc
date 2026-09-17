# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=ai-to-outbound
# List: ai combined domains + CIDR
# RouterOS address-list: DST-AI-TO-OUTBOUND
# Last update: 2026-09-17 07:41:10 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AI-TO-OUTBOUND]
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:apple.com" } on-error={}
:do { add name="browser-intake-datadoghq.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:browser-intake-datadoghq.com" } on-error={}
:do { add name="chatgpt.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:chatgpt.com" } on-error={}
:do { add name="cloudflare.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:cloudflare.com" } on-error={}
:do { add name="imgix.net" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:imgix.net" } on-error={}
:do { add name="intercom.io" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:intercom.io" } on-error={}
:do { add name="intercomcdn.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:intercomcdn.com" } on-error={}
:do { add name="oaistatic.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:oaistatic.com" } on-error={}
:do { add name="oaistatsig.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:oaistatsig.com" } on-error={}
:do { add name="oaiusercontent.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:oaiusercontent.com" } on-error={}
:do { add name="openai.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:openai.com" } on-error={}
:do { add name="openaimerge.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:openaimerge.com" } on-error={}
:do { add name="sendgrid.net" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:sendgrid.net" } on-error={}
:do { add name="sentry.io" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:sentry.io" } on-error={}
:do { add name="stripe.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:stripe.com" } on-error={}
:do { add name="workos.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:workos.com" } on-error={}
:do { add name="workoscdn.com" type=FWD match-subdomain=yes address-list=DST-AI-TO-OUTBOUND comment="openai:workoscdn.com" } on-error={}

/ip firewall address-list
remove [find list=DST-AI-TO-OUTBOUND]

