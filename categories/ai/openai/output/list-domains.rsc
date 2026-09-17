# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=openai
# List: OpenAI domains
# RouterOS address-list: DST-OPENAI-TO-OUTBOUND
# Source: OpenAI ChatGPT network recommendations (official-allowlist)
# Normalized source domain count: 19
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-OPENAI-TO-OUTBOUND]
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:apple.com" } on-error={}
:do { add name="browser-intake-datadoghq.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:browser-intake-datadoghq.com" } on-error={}
:do { add name="chatgpt.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:chatgpt.com" } on-error={}
:do { add name="cloudflare.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:cloudflare.com" } on-error={}
:do { add name="imgix.net" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:imgix.net" } on-error={}
:do { add name="intercom.io" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:intercom.io" } on-error={}
:do { add name="intercomcdn.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:intercomcdn.com" } on-error={}
:do { add name="oaistatic.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:oaistatic.com" } on-error={}
:do { add name="oaistatsig.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:oaistatsig.com" } on-error={}
:do { add name="oaiusercontent.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:oaiusercontent.com" } on-error={}
:do { add name="openai.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:openai.com" } on-error={}
:do { add name="openaimerge.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:openaimerge.com" } on-error={}
:do { add name="sendgrid.net" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:sendgrid.net" } on-error={}
:do { add name="sentry.io" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:sentry.io" } on-error={}
:do { add name="stripe.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:stripe.com" } on-error={}
:do { add name="workos.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:workos.com" } on-error={}
:do { add name="workoscdn.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:workoscdn.com" } on-error={}
