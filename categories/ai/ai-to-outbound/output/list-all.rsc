# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=ai-to-outbound
# List: ai combined domains + CIDR
# RouterOS address-list: DST-AI-TO-OUTBOUND
# Last update: 2026-07-19 14:19:55 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AI-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)auth\\.openai\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:auth.openai.com" } on-error={}
:do { add regexp="(^|.*\\.)challenges\\.cloudflare\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:challenges.cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)chatgpt\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:chatgpt.com" } on-error={}
:do { add regexp="(^|.*\\.)ct\\.sendgrid\\.net\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:ct.sendgrid.net" } on-error={}
:do { add regexp="(^|.*\\.)humb\\.apple\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:humb.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)images\\.workoscdn\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:images.workoscdn.com" } on-error={}
:do { add regexp="(^|.*\\.)intercom\\.io\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:intercom.io" } on-error={}
:do { add regexp="(^|.*\\.)intercomcdn\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:intercomcdn.com" } on-error={}
:do { add regexp="(^|.*\\.)js\\.stripe\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:js.stripe.com" } on-error={}
:do { add regexp="(^|.*\\.)o207216\\.ingest\\.sentry\\.io\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:o207216.ingest.sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)o33249\\.ingest\\.sentry\\.io\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:o33249.ingest.sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)oaistatic\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:oaistatic.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatsig\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:oaistatsig.com" } on-error={}
:do { add regexp="(^|.*\\.)oaiusercontent\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:oaiusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)openai\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:openai.com" } on-error={}
:do { add regexp="(^|.*\\.)openaimerge\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:openaimerge.com" } on-error={}
:do { add regexp="(^|.*\\.)rum\\.browser-intake-datadoghq\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:rum.browser-intake-datadoghq.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.com\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:workos.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.imgix\\.net\$" type=FWD address-list=DST-AI-TO-OUTBOUND comment="openai:workos.imgix.net" } on-error={}

/ip firewall address-list
remove [find list=DST-AI-TO-OUTBOUND]

