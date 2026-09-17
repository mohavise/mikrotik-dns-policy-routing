# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# List: Google Play combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-PLAY-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-PLAY-TO-OUTBOUND]
:do { add name="accounts.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:accounts.google.com" } on-error={}
:do { add name="accounts.youtube.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:accounts.youtube.com" } on-error={}
:do { add name="ajax.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ajax.googleapis.com" } on-error={}
:do { add name="android.apis.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.apis.google.com" } on-error={}
:do { add name="android.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add name="android.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.googleapis.com" } on-error={}
:do { add name="androidmanagement.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:androidmanagement.googleapis.com" } on-error={}
:do { add name="apis.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:apis.google.com" } on-error={}
:do { add name="clients1.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients1.google.com" } on-error={}
:do { add name="clients2.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients2.google.com" } on-error={}
:do { add name="clients3.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients3.google.com" } on-error={}
:do { add name="clients4.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients4.google.com" } on-error={}
:do { add name="clients5.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients5.google.com" } on-error={}
:do { add name="clients6.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:clients6.google.com" } on-error={}
:do { add name="crl.pki.goog" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:crl.pki.goog" } on-error={}
:do { add name="dl-ssl.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dl-ssl.google.com" } on-error={}
:do { add name="dl.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:dl.google.com" } on-error={}
:do { add name="enterprise.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:enterprise.google.com" } on-error={}
:do { add name="fcm-xmpp.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:fcm-xmpp.googleapis.com" } on-error={}
:do { add name="fcm.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:fcm.googleapis.com" } on-error={}
:do { add name="firebaseinstallations.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:firebaseinstallations.googleapis.com" } on-error={}
:do { add name="firebaselogging.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:firebaselogging.googleapis.com" } on-error={}
:do { add name="fonts.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:fonts.googleapis.com" } on-error={}
:do { add name="gcm-http.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gcm-http.googleapis.com" } on-error={}
:do { add name="gcm-xmpp.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gcm-xmpp.googleapis.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add name="google-analytics.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add name="gvt1.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add name="gvt2.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add name="gvt3.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add name="m.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:m.google.com" } on-error={}
:do { add name="notifications.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:notifications.google.com" } on-error={}
:do { add name="ocsp.pki.goog" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ocsp.pki.goog" } on-error={}
:do { add name="ogs.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ogs.google.com" } on-error={}
:do { add name="payments.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:payments.google.com" } on-error={}
:do { add name="pki.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:pki.google.com" } on-error={}
:do { add name="play.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:play.google.com" } on-error={}
:do { add name="www.google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:www.google.com" } on-error={}
:do { add name="www.googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:www.googleapis.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-PLAY-TO-OUTBOUND]
