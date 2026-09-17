# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# List: Microsoft 365 domains
# RouterOS address-list: DST-MICROSOFT-365-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Normalized source domain count: 12
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-365-TO-OUTBOUND]
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="live.com" comment="microsoft-365:seed:live.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="microsoft365.com" comment="microsoft-365:seed:microsoft365.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="microsoftonline.com" comment="microsoft-365:seed:microsoftonline.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="msauth.net" comment="microsoft-365:seed:msauth.net" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="msftauth.net" comment="microsoft-365:seed:msftauth.net" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="msocdn.com" comment="microsoft-365:seed:msocdn.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="office.com" comment="microsoft-365:seed:office.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="office.net" comment="microsoft-365:seed:office.net" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="office365.com" comment="microsoft-365:seed:office365.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="outlook.com" comment="microsoft-365:seed:outlook.com" } on-error={}
:do { add list=DST-MICROSOFT-365-TO-OUTBOUND address="sharepoint.com" comment="microsoft-365:seed:sharepoint.com" } on-error={}

/ip dns static
remove [find address-list=DST-MICROSOFT-365-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft365\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:microsoft365.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msocdn\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:msocdn.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:office.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:office.net" } on-error={}
:do { add regexp="(^|.*\\.)office365\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:office365.com" } on-error={}
:do { add regexp="(^|.*\\.)outlook\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:outlook.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com$" type=FWD address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:dns:sharepoint.com" } on-error={}
