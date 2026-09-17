# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# List: microsoft services combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-SERVICES-TO-OUTBOUND
# Last update: 2026-09-17 18:37:11 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="live.com" comment="microsoft-365:seed:live.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="microsoft365.com" comment="microsoft-365:seed:microsoft365.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="microsoftonline.com" comment="microsoft-365:seed:microsoftonline.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="msauth.net" comment="microsoft-365:seed:msauth.net" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="msftauth.net" comment="microsoft-365:seed:msftauth.net" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="msocdn.com" comment="microsoft-365:seed:msocdn.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="office.com" comment="microsoft-365:seed:office.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="office.net" comment="microsoft-365:seed:office.net" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="office365.com" comment="microsoft-365:seed:office365.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="outlook.com" comment="microsoft-365:seed:outlook.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="sharepoint.com" comment="microsoft-365:seed:sharepoint.com" } on-error={}

/ip dns static
remove [find address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft365\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:microsoft365.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msocdn\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:msocdn.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:office.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:office.net" } on-error={}
:do { add regexp="(^|.*\\.)office365\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:office365.com" } on-error={}
:do { add regexp="(^|.*\\.)outlook\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:outlook.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:dns:sharepoint.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="1drv.com" comment="onedrive:seed:1drv.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="1drv.ms" comment="onedrive:seed:1drv.ms" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="live.com" comment="onedrive:seed:live.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="onedrive.com" comment="onedrive:seed:onedrive.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="sharepoint.com" comment="onedrive:seed:sharepoint.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)1drv\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)1drv\\.ms$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:onedrive.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:sharepoint.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="live.com" comment="teams:seed:live.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="lync.com" comment="teams:seed:lync.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="microsoft.com" comment="teams:seed:microsoft.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="office.net" comment="teams:seed:office.net" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="sfbassets.com" comment="teams:seed:sfbassets.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="skype.com" comment="teams:seed:skype.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)lync\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:office.net" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:skype.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="microsoft.com" comment="windows-update:seed:microsoft.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="windowsupdate.com" comment="windows-update:seed:windowsupdate.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)windowsupdate\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:dns:windowsupdate.com" } on-error={}

/ip firewall address-list

