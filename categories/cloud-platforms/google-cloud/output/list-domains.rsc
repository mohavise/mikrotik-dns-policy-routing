# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# List: Google Cloud domains
# RouterOS address-list: DST-GOOGLE-CLOUD-TO-OUTBOUND
# Source: Google official Cloud console required domains (official-control-plane-domains)
# Normalized source domain count: 8
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
:do { add list=DST-GOOGLE-CLOUD-TO-OUTBOUND address="google.com" comment="google-cloud:seed:google.com" } on-error={}
:do { add list=DST-GOOGLE-CLOUD-TO-OUTBOUND address="googleapis.com" comment="google-cloud:seed:googleapis.com" } on-error={}
:do { add list=DST-GOOGLE-CLOUD-TO-OUTBOUND address="gstatic.com" comment="google-cloud:seed:gstatic.com" } on-error={}
:do { add list=DST-GOOGLE-CLOUD-TO-OUTBOUND address="withgoogle.com" comment="google-cloud:seed:withgoogle.com" } on-error={}

/ip dns static
remove [find address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:dns:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)withgoogle\\.com$" type=FWD address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND comment="google-cloud:dns:withgoogle.com" } on-error={}
