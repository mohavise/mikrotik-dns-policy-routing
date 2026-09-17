# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-platforms-to-outbound
# List: cloud platforms combined domains + CIDR
# RouterOS address-list: DST-CLOUD-PLATFORMS-TO-OUTBOUND
# Last update: 2026-09-17 07:10:49 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
:do { add name="aws.amazon.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:aws.amazon.com" } on-error={}
:do { add name="awsstatic.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add name="console.aws.a2z.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:console.aws.a2z.com" } on-error={}
:do { add name="opfcaptcha-prod.s3.amazonaws.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:opfcaptcha-prod.s3.amazonaws.com" } on-error={}
:do { add name="signin.aws" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list
remove [find list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]

/ip dns static
:do { add name="accounts.google.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:accounts.google.com" } on-error={}
:do { add name="apis.google.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:apis.google.com" } on-error={}
:do { add name="clients6.google.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:clients6.google.com" } on-error={}
:do { add name="cloud.google.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:cloud.google.com" } on-error={}
:do { add name="csp.withgoogle.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:csp.withgoogle.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
:do { add name="reauth.cloud.google.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:reauth.cloud.google.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="azure.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add name="azure.microsoft.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:azure.microsoft.com" } on-error={}
:do { add name="graph.microsoft.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:graph.microsoft.com" } on-error={}
:do { add name="graph.windows.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:graph.windows.net" } on-error={}
:do { add name="login.live.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:login.live.com" } on-error={}
:do { add name="login.microsoft.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:login.microsoft.com" } on-error={}
:do { add name="login.microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:login.microsoftonline.com" } on-error={}
:do { add name="microsoftonline-p.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add name="msauthimages.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add name="msftauthimages.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add name="portal.azure.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:portal.azure.net" } on-error={}

/ip firewall address-list

