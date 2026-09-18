# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=google-services-to-outbound
# List: google services combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-SERVICES-TO-OUTBOUND
# Last update: 2026-09-18 08:59:31 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-SERVICES-TO-OUTBOUND]
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="google.com" comment="google-drive:seed:google.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="googleapis.com" comment="google-drive:seed:googleapis.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="googleusercontent.com" comment="google-drive:seed:googleusercontent.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="gstatic.com" comment="google-drive:seed:gstatic.com" } on-error={}

/ip dns static
remove [find address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:dns:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:dns:gstatic.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="ggpht.com" comment="youtube:seed:ggpht.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="googlevideo.com" comment="youtube:seed:googlevideo.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="youtu.be" comment="youtube:seed:youtu.be" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="youtube-nocookie.com" comment="youtube:seed:youtube-nocookie.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="youtube.com" comment="youtube:seed:youtube.com" } on-error={}
:do { add list=DST-GOOGLE-SERVICES-TO-OUTBOUND address="ytimg.com" comment="youtube:seed:ytimg.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)ggpht\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:dns:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)googlevideo\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:dns:googlevideo.com" } on-error={}
:do { add regexp="(^|.*\\.)youtu\\.be$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:dns:youtu.be" } on-error={}
:do { add regexp="(^|.*\\.)youtube-nocookie\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:dns:youtube-nocookie.com" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:dns:youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)ytimg\\.com$" type=FWD address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:dns:ytimg.com" } on-error={}

/ip firewall address-list

