# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# List: Microsoft Azure combined domains + CIDR
# RouterOS address-list: DST-MICROSOFT-AZURE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
:do { add name="azure.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add name="azure.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:azure.net" } on-error={}
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:live.com" } on-error={}
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:microsoft.com" } on-error={}
:do { add name="microsoftonline-p.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add name="msauthimages.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add name="msftauthimages.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add name="windows.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND comment="microsoft-azure:windows.net" } on-error={}

/ip firewall address-list
remove [find list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
