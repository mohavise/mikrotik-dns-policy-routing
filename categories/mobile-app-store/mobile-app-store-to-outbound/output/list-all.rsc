# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=mobile-app-store-to-outbound
# List: mobile app store combined domains + CIDR
# RouterOS address-list: DST-MOBILE-APP-STORE-TO-OUTBOUND
# Last update: 2026-09-18 08:20:08 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MOBILE-APP-STORE-TO-OUTBOUND]
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="apple-cloudkit.com" comment="apple-app-store:seed:apple-cloudkit.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="apple.com" comment="apple-app-store:seed:apple.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="mzstatic.com" comment="apple-app-store:seed:mzstatic.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="safebrowsing.apple" comment="apple-app-store:seed:safebrowsing.apple" } on-error={}

/ip dns static
remove [find address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)apple-cloudkit\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:apple-cloudkit.com" } on-error={}
:do { add regexp="(^|.*\\.)apple\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:apple.com" } on-error={}
:do { add regexp="(^|.*\\.)mzstatic\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:mzstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)safebrowsing\\.apple$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:safebrowsing.apple" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="android.com" comment="google-play:seed:android.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="ggpht.com" comment="google-play:seed:ggpht.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="google-analytics.com" comment="google-play:seed:google-analytics.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="google.com" comment="google-play:seed:google.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="googleapis.com" comment="google-play:seed:googleapis.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="googleusercontent.com" comment="google-play:seed:googleusercontent.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="gstatic.com" comment="google-play:seed:gstatic.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="gvt1.com" comment="google-play:seed:gvt1.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="gvt2.com" comment="google-play:seed:gvt2.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="gvt3.com" comment="google-play:seed:gvt3.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="pki.goog" comment="google-play:seed:pki.goog" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="youtube.com" comment="google-play:seed:youtube.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)android\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:android.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)google-analytics\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:google-analytics.com" } on-error={}
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt1\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:gvt1.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt2\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:gvt2.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt3\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:gvt3.com" } on-error={}
:do { add regexp="(^|.*\\.)pki\\.goog$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:pki.goog" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:dns:youtube.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="llnwd.net" comment="samsung-galaxy-store:seed:llnwd.net" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="ospserver.net" comment="samsung-galaxy-store:seed:ospserver.net" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="samsung.cn" comment="samsung-galaxy-store:seed:samsung.cn" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="samsung.com" comment="samsung-galaxy-store:seed:samsung.com" } on-error={}
:do { add list=DST-MOBILE-APP-STORE-TO-OUTBOUND address="samsungapps.com" comment="samsung-galaxy-store:seed:samsungapps.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)llnwd\\.net$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:llnwd.net" } on-error={}
:do { add regexp="(^|.*\\.)ospserver\\.net$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:ospserver.net" } on-error={}
:do { add regexp="(^|.*\\.)samsung\\.cn$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsung.cn" } on-error={}
:do { add regexp="(^|.*\\.)samsung\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsung.com" } on-error={}
:do { add regexp="(^|.*\\.)samsungapps\\.com$" type=FWD address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsungapps.com" } on-error={}

/ip firewall address-list

