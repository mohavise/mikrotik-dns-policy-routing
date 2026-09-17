# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# List: Samsung Galaxy Store combined domains + CIDR
# RouterOS address-list: DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
:do { add name="llnwd.net" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:llnwd.net" } on-error={}
:do { add name="ospserver.net" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:ospserver.net" } on-error={}
:do { add name="samsung.cn" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsung.cn" } on-error={}
:do { add name="samsung.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsung.com" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}

/ip firewall address-list
remove [find list=DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND]
