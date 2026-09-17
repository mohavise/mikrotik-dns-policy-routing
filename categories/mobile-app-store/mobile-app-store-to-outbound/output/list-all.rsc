# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=mobile-app-store-to-outbound
# List: mobile app store combined domains + CIDR
# RouterOS address-list: DST-MOBILE-APP-STORE-TO-OUTBOUND
# Last update: 2026-09-17 07:15:07 UTC
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
:do { add name="accounts.youtube.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:accounts.youtube.com" } on-error={}
:do { add name="android.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add name="crl.pki.goog" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:crl.pki.goog" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add name="google-analytics.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add name="gvt1.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add name="gvt2.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add name="gvt3.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add name="ocsp.pki.goog" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ocsp.pki.goog" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="apps-dn2.ospserver.net" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps-dn2.ospserver.net" } on-error={}
:do { add name="apps.samsung.cn" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.cn" } on-error={}
:do { add name="apps.samsung.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.com" } on-error={}
:do { add name="samsappsbn.vo.llnwd.net" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsappsbn.vo.llnwd.net" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}

/ip firewall address-list

