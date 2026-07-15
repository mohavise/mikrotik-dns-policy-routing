# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# List: microsoft services combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-SERVICES-TO-OUTBOUND
# Last update: 2026-07-15 00:51:09 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)microsoft365\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msocdn\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add regexp="(^|.*\\.)office365\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add regexp="(^|.*\\.)officeapps\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:officeapps.live.com" } on-error={}
:do { add regexp="(^|.*\\.)outlook\\.office\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:outlook.office.com" } on-error={}
:do { add regexp="(^|.*\\.)protection\\.outlook\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:protection.outlook.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}

/ip firewall address-list
remove [find list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]

/ip dns static
:do { add regexp="(^|.*\\.)1drv\\.ms\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)files\\.1drv\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:files.1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:onedrive.live.com" } on-error={}
:do { add regexp="(^|.*\\.)public\\.dm\\.files\\.1drv\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:public.dm.files.1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}
:do { add regexp="(^|.*\\.)storage\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:storage.live.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)lync\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:skype.com" } on-error={}
:do { add regexp="(^|.*\\.)statics\\.teams\\.cdn\\.office\\.net\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:statics.teams.cdn.office.net" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.cdn\\.office\\.net\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:teams.cdn.office.net" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:teams.live.com" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:teams.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)users\\.storage\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:users.storage.live.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)delivery\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:delivery.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)dl\\.delivery\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:dl.delivery.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.windowsupdate\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:download.windowsupdate.com" } on-error={}
:do { add regexp="(^|.*\\.)emdl\\.ws\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:emdl.ws.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)prod\\.do\\.dsp\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:prod.do.dsp.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)tsfe\\.trafficshaping\\.dsp\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:tsfe.trafficshaping.dsp.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)update\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:update.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)windowsupdate\\.com\$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}

/ip firewall address-list

