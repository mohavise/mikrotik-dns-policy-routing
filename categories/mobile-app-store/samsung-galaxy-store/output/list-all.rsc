# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# List: Samsung Galaxy Store combined domains + CIDR
# RouterOS address-list: DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
:do { add name="apps-dn2.ospserver.net" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps-dn2.ospserver.net" } on-error={}
:do { add name="apps.samsung.cn" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.cn" } on-error={}
:do { add name="apps.samsung.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.com" } on-error={}
:do { add name="cdnet-dn.gw.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cdnet-dn.gw.samsungapps.com" } on-error={}
:do { add name="cf-dn.gw.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cf-dn.gw.samsungapps.com" } on-error={}
:do { add name="cn-ms.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:cn-ms.samsungapps.com" } on-error={}
:do { add name="hub-odc.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:hub-odc.samsungapps.com" } on-error={}
:do { add name="img.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:img.samsungapps.com" } on-error={}
:do { add name="odc.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:odc.samsungapps.com" } on-error={}
:do { add name="samsappsbn.vo.llnwd.net" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsappsbn.vo.llnwd.net" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}
:do { add name="vas.samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:vas.samsungapps.com" } on-error={}

/ip firewall address-list
remove [find list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
