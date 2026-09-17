# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# List: Google Play combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-PLAY-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GOOGLE-PLAY-TO-OUTBOUND]
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="android.com" comment="google-play:seed:android.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="ggpht.com" comment="google-play:seed:ggpht.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="google-analytics.com" comment="google-play:seed:google-analytics.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="google.com" comment="google-play:seed:google.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="googleapis.com" comment="google-play:seed:googleapis.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="googleusercontent.com" comment="google-play:seed:googleusercontent.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="gstatic.com" comment="google-play:seed:gstatic.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="gvt1.com" comment="google-play:seed:gvt1.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="gvt2.com" comment="google-play:seed:gvt2.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="gvt3.com" comment="google-play:seed:gvt3.com" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="pki.goog" comment="google-play:seed:pki.goog" } on-error={}
:do { add list=DST-GOOGLE-PLAY-TO-OUTBOUND address="youtube.com" comment="google-play:seed:youtube.com" } on-error={}

/ip dns static
remove [find address-list=DST-GOOGLE-PLAY-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)android\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:android.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)google-analytics\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:google-analytics.com" } on-error={}
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt1\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:gvt1.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt2\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:gvt2.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt3\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:gvt3.com" } on-error={}
:do { add regexp="(^|.*\\.)pki\\.goog$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:pki.goog" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dns:youtube.com" } on-error={}

/ip firewall address-list
