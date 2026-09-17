# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# List: OneDrive combined domains + CIDR
# RouterOS address-list: DST-ONEDRIVE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-ONEDRIVE-TO-OUTBOUND]
:do { add name="1drv.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:1drv.com" } on-error={}
:do { add name="1drv.ms" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:live.com" } on-error={}
:do { add name="onedrive.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}

/ip firewall address-list
remove [find list=DST-ONEDRIVE-TO-OUTBOUND]
