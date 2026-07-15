# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-drive
# List: Google Drive combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-DRIVE-TO-OUTBOUND
# Domain source: Google Drive public/service domains (official-google-service-domains)
# Last update: 2026-07-15 00:51:07 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)docs\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:docs.google.com" } on-error={}
:do { add regexp="(^|.*\\.)drive\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:drive.google.com" } on-error={}
:do { add regexp="(^|.*\\.)drive\\.usercontent\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:drive.usercontent.google.com" } on-error={}
:do { add regexp="(^|.*\\.)forms\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:forms.google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)sheets\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:sheets.google.com" } on-error={}
:do { add regexp="(^|.*\\.)slides\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:slides.google.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
