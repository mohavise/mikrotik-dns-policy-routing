# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# List: Microsoft Azure domains
# RouterOS address-list: DST-MICROSOFT-AZURE-TO-OUTBOUND
# Source: Microsoft official Azure portal allowlist (official-control-plane-domains)
# Last update: 2026-07-18 00:56:21 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)azure\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add regexp="(^|.*\\.)azure\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:azure.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:graph.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.windows\\.net\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:graph.windows.net" } on-error={}
:do { add regexp="(^|.*\\.)login\\.live\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:login.live.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.microsoft\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:login.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.microsoftonline\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:login.microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline-p\\.com\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msauthimages\\.net\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauthimages\\.net\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)portal\\.azure\\.net\$" type=FWD address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:portal.azure.net" } on-error={}
