# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-platforms-to-outbound
# List: cloud platforms combined domains + CIDR
# RouterOS address-list: DST-CLOUD-PLATFORMS-TO-OUTBOUND
# Last update: 2026-09-17 07:40:47 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
:do { add name="a2z.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:a2z.com" } on-error={}
:do { add name="amazon.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:amazon.com" } on-error={}
:do { add name="amazonaws.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:amazonaws.com" } on-error={}
:do { add name="awsstatic.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add name="signin.aws" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list
remove [find list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]

/ip dns static
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
:do { add name="withgoogle.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="google-cloud:withgoogle.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="azure.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add name="azure.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:azure.net" } on-error={}
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:live.com" } on-error={}
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:microsoft.com" } on-error={}
:do { add name="microsoftonline-p.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add name="msauthimages.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add name="msftauthimages.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add name="windows.net" type=FWD match-subdomain=yes address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND comment="microsoft-azure:windows.net" } on-error={}

/ip firewall address-list

