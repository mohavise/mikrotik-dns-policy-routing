# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# List: Microsoft 365 combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-365-TO-OUTBOUND
# Domain source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Last update: 2026-07-11 00:57:21 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-365-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)microsoft365\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msocdn\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add regexp="(^|.*\\.)office365\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add regexp="(^|.*\\.)officeapps\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:officeapps.live.com" } on-error={}
:do { add regexp="(^|.*\\.)outlook\\.office\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:outlook.office.com" } on-error={}
:do { add regexp="(^|.*\\.)protection\\.outlook\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:protection.outlook.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com\$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}

/ip firewall address-list
remove [find list=DST-MICROSOFT-365-TO-OUTBOUND]
