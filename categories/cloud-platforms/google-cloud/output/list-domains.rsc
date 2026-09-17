# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# List: Google Cloud domains
# RouterOS address-list: DST-GOOGLE-CLOUD-TO-OUTBOUND
# Source: Google official Cloud console required domains (official-control-plane-domains)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
:do { add name="accounts.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:accounts.google.com" } on-error={}
:do { add name="apis.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:apis.google.com" } on-error={}
:do { add name="clients6.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:clients6.google.com" } on-error={}
:do { add name="cloud.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:cloud.google.com" } on-error={}
:do { add name="csp.withgoogle.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:csp.withgoogle.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
