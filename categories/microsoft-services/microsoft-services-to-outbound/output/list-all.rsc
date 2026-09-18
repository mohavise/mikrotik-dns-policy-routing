# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# List: microsoft services combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-SERVICES-TO-OUTBOUND
# Last update: 2026-09-18 08:53:04 UTC
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
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=104.146.128.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=104.47.0.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.128.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.136.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.140.6/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.18.10/31 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.18.15/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.6.152/31 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.6.171/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.6.192/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=13.107.9.192/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=131.253.33.215/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=132.245.0.0/16 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=150.171.32.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=150.171.40.0/22 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=20.190.128.0/18 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=20.20.32.0/19 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=20.231.128.0/19 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=204.79.197.215/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=23.103.160.0/20 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=40.104.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=40.107.0.0/16 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=40.108.128.0/17 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=40.126.0.0/18 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=40.92.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=40.96.0.0/13 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.100.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.104.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.108.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.112.0.0/14 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.122.0.0/15 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.238.78.88/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.244.37.168/32 comment="microsoft-365-cidr" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address=52.96.0.0/14 comment="microsoft-365-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="1drv.com" comment="onedrive:seed:1drv.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="1drv.ms" comment="onedrive:seed:1drv.ms" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="onedrive.com" comment="onedrive:seed:onedrive.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)1drv\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)1drv\\.ms$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:dns:onedrive.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="lync.com" comment="teams:seed:lync.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="microsoft.com" comment="teams:seed:microsoft.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="sfbassets.com" comment="teams:seed:sfbassets.com" } on-error={}
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="skype.com" comment="teams:seed:skype.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)lync\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:dns:skype.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MICROSOFT-SERVICES-TO-OUTBOUND address="windowsupdate.com" comment="windows-update:seed:windowsupdate.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)windowsupdate\\.com$" type=FWD address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:dns:windowsupdate.com" } on-error={}

/ip firewall address-list

