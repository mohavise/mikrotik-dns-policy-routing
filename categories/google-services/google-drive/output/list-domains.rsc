# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-drive
# List: Google Drive domains
# RouterOS address-list: DST-GOOGLE-DRIVE-TO-OUTBOUND
# Source: Google Drive public/service domains (official-google-service-domains)
# Normalized source domain count: 10
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
:do { add list=DST-GOOGLE-DRIVE-TO-OUTBOUND address="google.com" comment="google-drive:seed:google.com" } on-error={}
:do { add list=DST-GOOGLE-DRIVE-TO-OUTBOUND address="googleapis.com" comment="google-drive:seed:googleapis.com" } on-error={}
:do { add list=DST-GOOGLE-DRIVE-TO-OUTBOUND address="googleusercontent.com" comment="google-drive:seed:googleusercontent.com" } on-error={}
:do { add list=DST-GOOGLE-DRIVE-TO-OUTBOUND address="gstatic.com" comment="google-drive:seed:gstatic.com" } on-error={}

/ip dns static
remove [find address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:dns:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:dns:gstatic.com" } on-error={}
