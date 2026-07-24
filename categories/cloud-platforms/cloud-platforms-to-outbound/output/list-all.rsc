# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-platforms-to-outbound
# List: cloud platforms combined domains + CIDR
# RouterOS address-list: DST-CLOUD-PLATFORMS-TO-OUTBOUND
# Last update: 2026-07-24 00:55:58 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)aws\\.amazon\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:aws.amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.aws\\.a2z\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:console.aws.a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)opfcaptcha-prod\\.s3\\.amazonaws\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:opfcaptcha-prod.s3.amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list
remove [find list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]

/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)apis\\.google\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:apis.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients6\\.google\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:clients6.google.com" } on-error={}
:do { add regexp="(^|.*\\.)cloud\\.google\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:cloud.google.com" } on-error={}
:do { add regexp="(^|.*\\.)csp\\.withgoogle\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:csp.withgoogle.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)reauth\\.cloud\\.google\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:reauth.cloud.google.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)azure\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add regexp="(^|.*\\.)azure\\.microsoft\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:azure.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.microsoft\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:graph.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.windows\\.net\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:graph.windows.net" } on-error={}
:do { add regexp="(^|.*\\.)login\\.live\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:login.live.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.microsoft\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:login.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.microsoftonline\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:login.microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline-p\\.com\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msauthimages\\.net\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauthimages\\.net\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)portal\\.azure\\.net\$" type=FWD address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:portal.azure.net" } on-error={}

/ip firewall address-list

