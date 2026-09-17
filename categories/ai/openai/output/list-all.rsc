# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=openai
# List: OpenAI combined domains + CIDR
# RouterOS address-list: DST-OPENAI-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-OPENAI-TO-OUTBOUND]
:do { add name="challenges.cloudflare.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:challenges.cloudflare.com" } on-error={}
:do { add name="chatgpt.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:chatgpt.com" } on-error={}
:do { add name="ct.sendgrid.net" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:ct.sendgrid.net" } on-error={}
:do { add name="humb.apple.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:humb.apple.com" } on-error={}
:do { add name="images.workoscdn.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:images.workoscdn.com" } on-error={}
:do { add name="intercom.io" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:intercom.io" } on-error={}
:do { add name="intercomcdn.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:intercomcdn.com" } on-error={}
:do { add name="js.stripe.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:js.stripe.com" } on-error={}
:do { add name="o207216.ingest.sentry.io" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:o207216.ingest.sentry.io" } on-error={}
:do { add name="o33249.ingest.sentry.io" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:o33249.ingest.sentry.io" } on-error={}
:do { add name="oaistatic.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:oaistatic.com" } on-error={}
:do { add name="oaistatsig.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:oaistatsig.com" } on-error={}
:do { add name="oaiusercontent.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:oaiusercontent.com" } on-error={}
:do { add name="openai.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:openai.com" } on-error={}
:do { add name="openaimerge.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:openaimerge.com" } on-error={}
:do { add name="rum.browser-intake-datadoghq.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:rum.browser-intake-datadoghq.com" } on-error={}
:do { add name="workos.com" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:workos.com" } on-error={}
:do { add name="workos.imgix.net" type=FWD match-subdomain=yes address-list=DST-OPENAI-TO-OUTBOUND comment="openai:workos.imgix.net" } on-error={}

/ip firewall address-list
remove [find list=DST-OPENAI-TO-OUTBOUND]
