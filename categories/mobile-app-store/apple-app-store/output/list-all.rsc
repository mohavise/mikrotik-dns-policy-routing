# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# List: Apple App Store combined domains + CIDR
# RouterOS address-list: DST-APPLE-APP-STORE-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-APPLE-APP-STORE-TO-OUTBOUND]
:do { add list=DST-APPLE-APP-STORE-TO-OUTBOUND address="apple-cloudkit.com" comment="apple-app-store:seed:apple-cloudkit.com" } on-error={}
:do { add list=DST-APPLE-APP-STORE-TO-OUTBOUND address="apple.com" comment="apple-app-store:seed:apple.com" } on-error={}
:do { add list=DST-APPLE-APP-STORE-TO-OUTBOUND address="mzstatic.com" comment="apple-app-store:seed:mzstatic.com" } on-error={}
:do { add list=DST-APPLE-APP-STORE-TO-OUTBOUND address="safebrowsing.apple" comment="apple-app-store:seed:safebrowsing.apple" } on-error={}

/ip dns static
remove [find address-list=DST-APPLE-APP-STORE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)apple-cloudkit\\.com$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:apple-cloudkit.com" } on-error={}
:do { add regexp="(^|.*\\.)apple\\.com$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:apple.com" } on-error={}
:do { add regexp="(^|.*\\.)mzstatic\\.com$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:mzstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)safebrowsing\\.apple$" type=FWD address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:dns:safebrowsing.apple" } on-error={}

/ip firewall address-list
