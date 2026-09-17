# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# List: Apple App Store combined domains + CIDR
# RouterOS address-list: DST-APPLE-APP-STORE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-APPLE-APP-STORE-TO-OUTBOUND]
:do { add name="apple-cloudkit.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apple-cloudkit.com" } on-error={}
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apple.com" } on-error={}
:do { add name="mzstatic.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add name="safebrowsing.apple" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:safebrowsing.apple" } on-error={}

/ip firewall address-list
remove [find list=DST-APPLE-APP-STORE-TO-OUTBOUND]
