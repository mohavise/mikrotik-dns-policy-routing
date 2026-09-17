# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# List: OneDrive domains
# RouterOS address-list: DST-ONEDRIVE-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Normalized source domain count: 7
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-ONEDRIVE-TO-OUTBOUND]
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address="1drv.com" comment="onedrive:seed:1drv.com" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address="1drv.ms" comment="onedrive:seed:1drv.ms" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address="live.com" comment="onedrive:seed:live.com" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address="onedrive.com" comment="onedrive:seed:onedrive.com" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address="sharepoint.com" comment="onedrive:seed:sharepoint.com" } on-error={}

/ip dns static
remove [find address-list=DST-ONEDRIVE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)1drv\\.com$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:dns:1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)1drv\\.ms$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:dns:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:dns:onedrive.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:dns:sharepoint.com" } on-error={}
