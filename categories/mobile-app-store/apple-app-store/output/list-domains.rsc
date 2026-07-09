# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# List: Apple App Store domains
# RouterOS address-list: DST-APPLE-APP-STORE-TO-OUTBOUND
# Source: Apple products on enterprise networks (official-vendor-docs)
# Last update: 2026-07-09 10:40:39 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-APPLE-APP-STORE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)api\\.apple-cloudkit\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:api.apple-cloudkit.com" } on-error={}
:do { add regexp="(^|.*\\.)appattest\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:appattest.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)apps-marketplace\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apps-marketplace.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)apps\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apps.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)audiocontentdownload\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:audiocontentdownload.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)devimages-cdn\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:devimages-cdn.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.developer\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:download.developer.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)itunes\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:itunes.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)mzstatic\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)playgrounds-assets-cdn\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:playgrounds-assets-cdn.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)playgrounds-cdn\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:playgrounds-cdn.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)ppq\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:ppq.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)sylvan\\.apple\\.com\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:sylvan.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)token\\.safebrowsing\\.apple\$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:token.safebrowsing.apple" } on-error={}
