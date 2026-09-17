# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# List: microsoft services combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-SERVICES-TO-OUTBOUND
# Last update: 2026-09-17 07:51:11 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:live.com" } on-error={}
:do { add name="microsoft365.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add name="msocdn.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add name="office.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add name="office365.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add name="outlook.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:outlook.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}

/ip firewall address-list
remove [find list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]

/ip dns static
:do { add name="1drv.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:1drv.com" } on-error={}
:do { add name="1drv.ms" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:live.com" } on-error={}
:do { add name="onedrive.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:live.com" } on-error={}
:do { add name="lync.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:microsoft.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:office.net" } on-error={}
:do { add name="sfbassets.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add name="skype.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:skype.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:microsoft.com" } on-error={}
:do { add name="windowsupdate.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}

/ip firewall address-list

