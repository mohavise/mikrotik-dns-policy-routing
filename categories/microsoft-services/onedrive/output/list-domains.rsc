# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# List: OneDrive domains
# RouterOS address-list: DST-ONEDRIVE-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Last update: 2026-07-13 01:05:35 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-ONEDRIVE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)1drv\\.ms\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)files\\.1drv\\.com\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:files.1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.live\\.com\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:onedrive.live.com" } on-error={}
:do { add regexp="(^|.*\\.)public\\.dm\\.files\\.1drv\\.com\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:public.dm.files.1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}
:do { add regexp="(^|.*\\.)storage\\.live\\.com\$" type=FWD address-list=DST-ONEDRIVE-TO-OUTBOUND comment="onedrive:storage.live.com" } on-error={}
