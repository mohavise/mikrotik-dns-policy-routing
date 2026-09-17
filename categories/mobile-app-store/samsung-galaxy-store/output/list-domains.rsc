# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# List: Samsung Galaxy Store domains
# RouterOS address-list: DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND
# Source: Samsung Apps authenticated proxy allowlist (official-vendor-docs)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
:do { add name="apps-dn2.ospserver.net" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps-dn2.ospserver.net" } on-error={}
:do { add name="apps.samsung.cn" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.cn" } on-error={}
:do { add name="apps.samsung.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.com" } on-error={}
:do { add name="samsappsbn.vo.llnwd.net" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsappsbn.vo.llnwd.net" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}
