# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=openai
# List: OpenAI domains
# RouterOS address-list: DST-OPENAI-TO-OUTBOUND
# Source: OpenAI ChatGPT network recommendations (official-allowlist)
# Normalized source domain count: 19
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-OPENAI-TO-OUTBOUND]
:do { add list=DST-OPENAI-TO-OUTBOUND address="apple.com" comment="openai:seed:apple.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="browser-intake-datadoghq.com" comment="openai:seed:browser-intake-datadoghq.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="chatgpt.com" comment="openai:seed:chatgpt.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="cloudflare.com" comment="openai:seed:cloudflare.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="imgix.net" comment="openai:seed:imgix.net" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="intercom.io" comment="openai:seed:intercom.io" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="intercomcdn.com" comment="openai:seed:intercomcdn.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="oaistatic.com" comment="openai:seed:oaistatic.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="oaistatsig.com" comment="openai:seed:oaistatsig.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="oaiusercontent.com" comment="openai:seed:oaiusercontent.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="openai.com" comment="openai:seed:openai.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="openaimerge.com" comment="openai:seed:openaimerge.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="sendgrid.net" comment="openai:seed:sendgrid.net" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="sentry.io" comment="openai:seed:sentry.io" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="stripe.com" comment="openai:seed:stripe.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="workos.com" comment="openai:seed:workos.com" } on-error={}
:do { add list=DST-OPENAI-TO-OUTBOUND address="workoscdn.com" comment="openai:seed:workoscdn.com" } on-error={}

/ip dns static
remove [find address-list=DST-OPENAI-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)apple\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:apple.com" } on-error={}
:do { add regexp="(^|.*\\.)browser-intake-datadoghq\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:browser-intake-datadoghq.com" } on-error={}
:do { add regexp="(^|.*\\.)chatgpt\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:chatgpt.com" } on-error={}
:do { add regexp="(^|.*\\.)cloudflare\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)imgix\\.net$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:imgix.net" } on-error={}
:do { add regexp="(^|.*\\.)intercom\\.io$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:intercom.io" } on-error={}
:do { add regexp="(^|.*\\.)intercomcdn\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:intercomcdn.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatic\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:oaistatic.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatsig\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:oaistatsig.com" } on-error={}
:do { add regexp="(^|.*\\.)oaiusercontent\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:oaiusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)openai\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:openai.com" } on-error={}
:do { add regexp="(^|.*\\.)openaimerge\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:openaimerge.com" } on-error={}
:do { add regexp="(^|.*\\.)sendgrid\\.net$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:sendgrid.net" } on-error={}
:do { add regexp="(^|.*\\.)sentry\\.io$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)stripe\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:stripe.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:workos.com" } on-error={}
:do { add regexp="(^|.*\\.)workoscdn\\.com$" type=FWD address-list=DST-OPENAI-TO-OUTBOUND comment="openai:dns:workoscdn.com" } on-error={}
