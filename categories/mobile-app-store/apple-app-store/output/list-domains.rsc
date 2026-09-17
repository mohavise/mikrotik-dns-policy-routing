# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=apple-app-store
# List: Apple App Store domains
# RouterOS address-list: DST-APPLE-APP-STORE-TO-OUTBOUND
# Source: Apple products on enterprise networks (official-vendor-docs)
# Normalized source domain count: 14
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-APPLE-APP-STORE-TO-OUTBOUND]
:do { add name="apple-cloudkit.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apple-cloudkit.com" } on-error={}
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:apple.com" } on-error={}
:do { add name="mzstatic.com" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add name="safebrowsing.apple" type=FWD match-subdomain=yes address-list=DST-APPLE-APP-STORE-TO-OUTBOUND comment="apple-app-store:safebrowsing.apple" } on-error={}
