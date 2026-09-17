# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# List: microsoft services combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-SERVICES-TO-OUTBOUND
# Last update: 2026-09-17 07:26:38 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
:do { add name="microsoft365.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add name="msocdn.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add name="office.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add name="office365.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add name="officeapps.live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:officeapps.live.com" } on-error={}
:do { add name="protection.outlook.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:protection.outlook.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}

/ip firewall address-list
remove [find list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]

/ip dns static
:do { add name="1drv.ms" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add name="files.1drv.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:files.1drv.com" } on-error={}
:do { add name="onedrive.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add name="onedrive.live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:onedrive.live.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}
:do { add name="storage.live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="onedrive:storage.live.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="lync.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add name="sfbassets.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add name="skype.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:skype.com" } on-error={}
:do { add name="teams.cdn.office.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:teams.cdn.office.net" } on-error={}
:do { add name="teams.live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:teams.live.com" } on-error={}
:do { add name="teams.microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:teams.microsoft.com" } on-error={}
:do { add name="users.storage.live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="teams:users.storage.live.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="delivery.mp.microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:delivery.mp.microsoft.com" } on-error={}
:do { add name="emdl.ws.microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:emdl.ws.microsoft.com" } on-error={}
:do { add name="prod.do.dsp.mp.microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:prod.do.dsp.mp.microsoft.com" } on-error={}
:do { add name="tsfe.trafficshaping.dsp.mp.microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:tsfe.trafficshaping.dsp.mp.microsoft.com" } on-error={}
:do { add name="update.microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:update.microsoft.com" } on-error={}
:do { add name="windowsupdate.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}

/ip firewall address-list

