# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# List: Apple App Store domains
# RouterOS address-list: DST-APPLE-APP-STORE-TO-OUTBOUND
# Source: Apple products on enterprise networks (official-vendor-docs)
# Normalized source domain count: 14
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-APPLE-APP-STORE-TO-OUTBOUND]
:do { add name="api.apple-cloudkit.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:api.apple-cloudkit.com" } on-error={}
:do { add name="appattest.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:appattest.apple.com" } on-error={}
:do { add name="apps-marketplace.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apps-marketplace.apple.com" } on-error={}
:do { add name="apps.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apps.apple.com" } on-error={}
:do { add name="audiocontentdownload.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:audiocontentdownload.apple.com" } on-error={}
:do { add name="devimages-cdn.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:devimages-cdn.apple.com" } on-error={}
:do { add name="download.developer.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:download.developer.apple.com" } on-error={}
:do { add name="itunes.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:itunes.apple.com" } on-error={}
:do { add name="mzstatic.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add name="playgrounds-assets-cdn.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:playgrounds-assets-cdn.apple.com" } on-error={}
:do { add name="playgrounds-cdn.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:playgrounds-cdn.apple.com" } on-error={}
:do { add name="ppq.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:ppq.apple.com" } on-error={}
:do { add name="sylvan.apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:sylvan.apple.com" } on-error={}
:do { add name="token.safebrowsing.apple" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:token.safebrowsing.apple" } on-error={}
