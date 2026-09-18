# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# List: OneDrive combined domains + CIDR
# RouterOS address-list: DST-ONEDRIVE-TO-OUTBOUND
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

/ip firewall address-list
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.6.171/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.6.192/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.9.192/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.18.15/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.136.0/22 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=13.107.140.6/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=20.20.32.0/19 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=20.190.128.0/18 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=20.231.128.0/19 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=40.108.128.0/17 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=40.126.0.0/18 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=52.104.0.0/13 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=52.244.37.168/32 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=104.146.128.0/17 comment="onedrive-cidr" } on-error={}
:do { add list=DST-ONEDRIVE-TO-OUTBOUND address=150.171.40.0/22 comment="onedrive-cidr" } on-error={}
