# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# List: Google Cloud domains
# RouterOS address-list: DST-GOOGLE-CLOUD-TO-OUTBOUND
# Source: Google official Cloud console required domains (official-control-plane-domains)
# Normalized source domain count: 8
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
:do { add name="withgoogle.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:withgoogle.com" } on-error={}
