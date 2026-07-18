# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# List: Windows Update domains
# RouterOS address-list: DST-WINDOWS-UPDATE-TO-OUTBOUND
# Source: Windows Update endpoint documentation (official-endpoint-docs)
# Last update: 2026-07-18 00:56:22 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)delivery\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:delivery.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)dl\\.delivery\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:dl.delivery.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.windowsupdate\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:download.windowsupdate.com" } on-error={}
:do { add regexp="(^|.*\\.)emdl\\.ws\\.microsoft\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:emdl.ws.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)prod\\.do\\.dsp\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:prod.do.dsp.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)tsfe\\.trafficshaping\\.dsp\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:tsfe.trafficshaping.dsp.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)update\\.microsoft\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:update.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)windowsupdate\\.com\$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}
