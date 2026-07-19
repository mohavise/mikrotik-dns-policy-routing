# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# List: Samsung Galaxy Store domains
# RouterOS address-list: DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND
# Source: Samsung Apps authenticated proxy allowlist (official-vendor-docs)
# Last update: 2026-07-19 01:01:57 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)apps-dn2\\.ospserver\\.net\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps-dn2.ospserver.net" } on-error={}
:do { add regexp="(^|.*\\.)apps\\.samsung\\.cn\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.cn" } on-error={}
:do { add regexp="(^|.*\\.)apps\\.samsung\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.com" } on-error={}
:do { add regexp="(^|.*\\.)cdnet-dn\\.gw\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cdnet-dn.gw.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)cf-dn\\.gw\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cf-dn.gw.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)cn-ms\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cn-ms.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)hub-odc\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:hub-odc.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)img\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:img.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)odc\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:odc.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)samsappsbn\\.vo\\.llnwd\\.net\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsappsbn.vo.llnwd.net" } on-error={}
:do { add regexp="(^|.*\\.)samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)vas\\.samsungapps\\.com\$" type=FWD address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:vas.samsungapps.com" } on-error={}
