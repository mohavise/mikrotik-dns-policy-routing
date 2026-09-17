# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# List: OneDrive domains
# RouterOS address-list: DST-ONEDRIVE-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-ONEDRIVE-TO-OUTBOUND]
:do { add name="1drv.ms" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add name="files.1drv.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:files.1drv.com" } on-error={}
:do { add name="onedrive.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add name="onedrive.live.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:onedrive.live.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}
:do { add name="storage.live.com" type=FWD match-subdomain=yes address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:storage.live.com" } on-error={}
