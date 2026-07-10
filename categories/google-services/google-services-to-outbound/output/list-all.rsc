# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=google-services-to-outbound
# List: google services combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-SERVICES-TO-OUTBOUND
# Last update: 2026-07-10 10:38:32 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)docs\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:docs.google.com" } on-error={}
:do { add regexp="(^|.*\\.)drive\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:drive.google.com" } on-error={}
:do { add regexp="(^|.*\\.)drive\\.usercontent\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:drive.usercontent.google.com" } on-error={}
:do { add regexp="(^|.*\\.)forms\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:forms.google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)sheets\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:sheets.google.com" } on-error={}
:do { add regexp="(^|.*\\.)slides\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:slides.google.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-SERVICES-TO-OUTBOUND]

/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googlevideo\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.youtube\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:m.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.youtube\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:www.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)youtu\\.be\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add regexp="(^|.*\\.)youtube-nocookie\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)youtubei\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtubei.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)ytimg\\.com\$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}

/ip firewall address-list

