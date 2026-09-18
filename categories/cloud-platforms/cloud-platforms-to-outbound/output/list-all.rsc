# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-platforms-to-outbound
# List: cloud platforms combined domains + CIDR
# RouterOS address-list: DST-CLOUD-PLATFORMS-TO-OUTBOUND
# Last update: 2026-09-18 08:59:31 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="a2z.com" comment="aws:seed:a2z.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="amazon.com" comment="aws:seed:amazon.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="amazonaws.com" comment="aws:seed:amazonaws.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="awsstatic.com" comment="aws:seed:awsstatic.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="signin.aws" comment="aws:seed:signin.aws" } on-error={}

/ip dns static
remove [find address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)a2z\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:dns:a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)amazon\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:dns:amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)amazonaws\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:dns:amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:dns:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:dns:signin.aws" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="google.com" comment="google-cloud:seed:google.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="googleapis.com" comment="google-cloud:seed:googleapis.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="gstatic.com" comment="google-cloud:seed:gstatic.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="withgoogle.com" comment="google-cloud:seed:withgoogle.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)google\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:dns:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:dns:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:dns:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)withgoogle\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:dns:withgoogle.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="azure.com" comment="microsoft-azure:seed:azure.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="azure.net" comment="microsoft-azure:seed:azure.net" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="live.com" comment="microsoft-azure:seed:live.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="microsoft.com" comment="microsoft-azure:seed:microsoft.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="microsoftonline-p.com" comment="microsoft-azure:seed:microsoftonline-p.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="microsoftonline.com" comment="microsoft-azure:seed:microsoftonline.com" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="msauth.net" comment="microsoft-azure:seed:msauth.net" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="msauthimages.net" comment="microsoft-azure:seed:msauthimages.net" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="msftauth.net" comment="microsoft-azure:seed:msftauth.net" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="msftauthimages.net" comment="microsoft-azure:seed:msftauthimages.net" } on-error={}
:do { add list=DST-CLOUD-PLATFORMS-TO-OUTBOUND address="windows.net" comment="microsoft-azure:seed:windows.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)azure\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:azure.com" } on-error={}
:do { add regexp="(^|.*\\.)azure\\.net$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:azure.net" } on-error={}
:do { add regexp="(^|.*\\.)live\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:live.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline-p\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:microsoftonline-p.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msauthimages\\.net$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:msauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauthimages\\.net$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:msftauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)windows\\.net$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:dns:windows.net" } on-error={}

/ip firewall address-list

