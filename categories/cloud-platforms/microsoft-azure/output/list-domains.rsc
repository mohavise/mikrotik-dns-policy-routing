# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# List: Microsoft Azure domains
# RouterOS address-list: DST-MICROSOFT-AZURE-TO-OUTBOUND
# Source: Microsoft official Azure portal allowlist (official-control-plane-domains)
# Normalized source domain count: 13
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="azure.com" comment="microsoft-azure:seed:azure.com" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="azure.net" comment="microsoft-azure:seed:azure.net" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="live.com" comment="microsoft-azure:seed:live.com" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="microsoft.com" comment="microsoft-azure:seed:microsoft.com" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="microsoftonline-p.com" comment="microsoft-azure:seed:microsoftonline-p.com" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="microsoftonline.com" comment="microsoft-azure:seed:microsoftonline.com" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="msauth.net" comment="microsoft-azure:seed:msauth.net" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="msauthimages.net" comment="microsoft-azure:seed:msauthimages.net" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="msftauth.net" comment="microsoft-azure:seed:msftauth.net" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="msftauthimages.net" comment="microsoft-azure:seed:msftauthimages.net" } on-error={}
:do { add list=DST-MICROSOFT-AZURE-TO-OUTBOUND address="windows.net" comment="microsoft-azure:seed:windows.net" } on-error={}

/ip dns static
remove [find address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)azure\\.com$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:azure.com" } on-error={}
:do { add regexp="(^|.*\\.)azure\\.net$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:azure.net" } on-error={}
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline-p\\.com$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:microsoftonline-p.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msauthimages\\.net$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:msauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauthimages\\.net$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:msftauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)windows\\.net$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:dns:windows.net" } on-error={}
