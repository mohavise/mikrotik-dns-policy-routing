# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=mobile-app-store-to-outbound
# List: mobile app store combined domains + CIDR
# RouterOS address-list: DST-MOBILE-APP-STORE-TO-OUTBOUND
# Last update: 2026-09-17 07:51:11 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND]
:do { add name="apple-cloudkit.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apple-cloudkit.com" } on-error={}
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apple.com" } on-error={}
:do { add name="mzstatic.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add name="safebrowsing.apple" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="apple-app-store:safebrowsing.apple" } on-error={}

/ip firewall address-list
remove [find list=DST-MOBILE-APP-STORE-TO-OUTBOUND]

/ip dns static
:do { add name="android.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add name="google-analytics.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add name="gvt1.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add name="gvt2.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add name="gvt3.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add name="pki.goog" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:pki.goog" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="google-play:youtube.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="llnwd.net" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:llnwd.net" } on-error={}
:do { add name="ospserver.net" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:ospserver.net" } on-error={}
:do { add name="samsung.cn" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsung.cn" } on-error={}
:do { add name="samsung.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsung.com" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}

/ip firewall address-list

