# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# List: Google Play combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-PLAY-TO-OUTBOUND
# Domain source: Android Enterprise Network Requirements (official-vendor-docs)
# Last update: 2026-07-11 00:57:21 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-PLAY-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)accounts\\.youtube\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:accounts.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)ajax\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ajax.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)android\\.apis\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.apis.google.com" } on-error={}
:do { add regexp="(^|.*\\.)android\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add regexp="(^|.*\\.)android\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)androidmanagement\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:androidmanagement.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)apis\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:apis.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients1\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients1.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients2\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients2.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients3\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients3.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients4\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients4.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients5\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients5.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients6\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients6.google.com" } on-error={}
:do { add regexp="(^|.*\\.)crl\\.pki\\.goog\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:crl.pki.goog" } on-error={}
:do { add regexp="(^|.*\\.)dl-ssl\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dl-ssl.google.com" } on-error={}
:do { add regexp="(^|.*\\.)dl\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dl.google.com" } on-error={}
:do { add regexp="(^|.*\\.)enterprise\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:enterprise.google.com" } on-error={}
:do { add regexp="(^|.*\\.)fcm-xmpp\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:fcm-xmpp.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)fcm\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:fcm.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)firebaseinstallations\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:firebaseinstallations.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)firebaselogging\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:firebaselogging.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)fonts\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:fonts.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gcm-http\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gcm-http.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gcm-xmpp\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gcm-xmpp.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)google-analytics\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add regexp="(^|.*\\.)google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt1\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt2\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt3\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:m.google.com" } on-error={}
:do { add regexp="(^|.*\\.)notifications\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:notifications.google.com" } on-error={}
:do { add regexp="(^|.*\\.)ocsp\\.pki\\.goog\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ocsp.pki.goog" } on-error={}
:do { add regexp="(^|.*\\.)ogs\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ogs.google.com" } on-error={}
:do { add regexp="(^|.*\\.)payments\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:payments.google.com" } on-error={}
:do { add regexp="(^|.*\\.)pki\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:pki.google.com" } on-error={}
:do { add regexp="(^|.*\\.)play\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:play.google.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.google\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:www.google.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.googleapis\\.com\$" type=FWD address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:www.googleapis.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-PLAY-TO-OUTBOUND]
