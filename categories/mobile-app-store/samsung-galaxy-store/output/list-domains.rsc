# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# List: Samsung Galaxy Store domains
# RouterOS address-list: DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND
# Source: Samsung Apps authenticated proxy allowlist (official-vendor-docs)
# Normalized source domain count: 12
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
:do { add list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND address="llnwd.net" comment="samsung-galaxy-store:seed:llnwd.net" } on-error={}
:do { add list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND address="ospserver.net" comment="samsung-galaxy-store:seed:ospserver.net" } on-error={}
:do { add list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND address="samsung.cn" comment="samsung-galaxy-store:seed:samsung.cn" } on-error={}
:do { add list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND address="samsung.com" comment="samsung-galaxy-store:seed:samsung.com" } on-error={}
:do { add list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND address="samsungapps.com" comment="samsung-galaxy-store:seed:samsungapps.com" } on-error={}

/ip dns static
remove [find address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)llnwd\\.net$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:llnwd.net" } on-error={}
:do { add regexp="(^|.*\\.)ospserver\\.net$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:ospserver.net" } on-error={}
:do { add regexp="(^|.*\\.)samsung\\.cn$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsung.cn" } on-error={}
:do { add regexp="(^|.*\\.)samsung\\.com$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsung.com" } on-error={}
:do { add regexp="(^|.*\\.)samsungapps\\.com$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:dns:samsungapps.com" } on-error={}
