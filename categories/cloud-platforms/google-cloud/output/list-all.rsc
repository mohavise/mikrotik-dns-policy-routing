# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# List: Google Cloud combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-CLOUD-TO-OUTBOUND
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
:do { add name="reauth.cloud.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:reauth.cloud.google.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
