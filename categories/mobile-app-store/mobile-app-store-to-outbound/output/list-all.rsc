# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=mobile-app-store-to-outbound
# List: mobile app store combined domains + CIDR
# RouterOS address-list: DST-MOBILE-APP-STORE-TO-OUTBOUND
# Last update: 2026-09-17 07:10:49 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND]
:do { add name="api.apple-cloudkit.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:api.apple-cloudkit.com" } on-error={}
:do { add name="appattest.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:appattest.apple.com" } on-error={}
:do { add name="apps-marketplace.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apps-marketplace.apple.com" } on-error={}
:do { add name="apps.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apps.apple.com" } on-error={}
:do { add name="audiocontentdownload.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:audiocontentdownload.apple.com" } on-error={}
:do { add name="devimages-cdn.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:devimages-cdn.apple.com" } on-error={}
:do { add name="download.developer.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:download.developer.apple.com" } on-error={}
:do { add name="itunes.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:itunes.apple.com" } on-error={}
:do { add name="mzstatic.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add name="playgrounds-assets-cdn.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:playgrounds-assets-cdn.apple.com" } on-error={}
:do { add name="playgrounds-cdn.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:playgrounds-cdn.apple.com" } on-error={}
:do { add name="ppq.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:ppq.apple.com" } on-error={}
:do { add name="sylvan.apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:sylvan.apple.com" } on-error={}
:do { add name="token.safebrowsing.apple" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:token.safebrowsing.apple" } on-error={}

/ip firewall address-list
remove [find list=DST-MOBILE-APP-STORE-TO-OUTBOUND]

/ip dns static
:do { add name="accounts.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:accounts.google.com" } on-error={}
:do { add name="accounts.youtube.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:accounts.youtube.com" } on-error={}
:do { add name="ajax.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ajax.googleapis.com" } on-error={}
:do { add name="android.apis.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:android.apis.google.com" } on-error={}
:do { add name="android.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add name="android.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:android.googleapis.com" } on-error={}
:do { add name="androidmanagement.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:androidmanagement.googleapis.com" } on-error={}
:do { add name="apis.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:apis.google.com" } on-error={}
:do { add name="clients1.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:clients1.google.com" } on-error={}
:do { add name="clients2.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:clients2.google.com" } on-error={}
:do { add name="clients3.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:clients3.google.com" } on-error={}
:do { add name="clients4.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:clients4.google.com" } on-error={}
:do { add name="clients5.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:clients5.google.com" } on-error={}
:do { add name="clients6.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:clients6.google.com" } on-error={}
:do { add name="crl.pki.goog" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:crl.pki.goog" } on-error={}
:do { add name="dl-ssl.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dl-ssl.google.com" } on-error={}
:do { add name="dl.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dl.google.com" } on-error={}
:do { add name="enterprise.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:enterprise.google.com" } on-error={}
:do { add name="fcm-xmpp.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:fcm-xmpp.googleapis.com" } on-error={}
:do { add name="fcm.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:fcm.googleapis.com" } on-error={}
:do { add name="firebaseinstallations.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:firebaseinstallations.googleapis.com" } on-error={}
:do { add name="firebaselogging.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:firebaselogging.googleapis.com" } on-error={}
:do { add name="fonts.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:fonts.googleapis.com" } on-error={}
:do { add name="gcm-http.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gcm-http.googleapis.com" } on-error={}
:do { add name="gcm-xmpp.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gcm-xmpp.googleapis.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add name="google-analytics.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add name="gvt1.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add name="gvt2.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add name="gvt3.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add name="m.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:m.google.com" } on-error={}
:do { add name="notifications.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:notifications.google.com" } on-error={}
:do { add name="ocsp.pki.goog" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ocsp.pki.goog" } on-error={}
:do { add name="ogs.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ogs.google.com" } on-error={}
:do { add name="payments.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:payments.google.com" } on-error={}
:do { add name="pki.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:pki.google.com" } on-error={}
:do { add name="play.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:play.google.com" } on-error={}
:do { add name="www.google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:www.google.com" } on-error={}
:do { add name="www.googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:www.googleapis.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="apps-dn2.ospserver.net" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps-dn2.ospserver.net" } on-error={}
:do { add name="apps.samsung.cn" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.cn" } on-error={}
:do { add name="apps.samsung.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.com" } on-error={}
:do { add name="cdnet-dn.gw.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cdnet-dn.gw.samsungapps.com" } on-error={}
:do { add name="cf-dn.gw.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cf-dn.gw.samsungapps.com" } on-error={}
:do { add name="cn-ms.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cn-ms.samsungapps.com" } on-error={}
:do { add name="hub-odc.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:hub-odc.samsungapps.com" } on-error={}
:do { add name="img.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:img.samsungapps.com" } on-error={}
:do { add name="odc.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:odc.samsungapps.com" } on-error={}
:do { add name="samsappsbn.vo.llnwd.net" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsappsbn.vo.llnwd.net" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}
:do { add name="vas.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:vas.samsungapps.com" } on-error={}

/ip firewall address-list

