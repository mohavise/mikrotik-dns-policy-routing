# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# List: Microsoft 365 domains
# RouterOS address-list: DST-MICROSOFT-365-TO-OUTBOUND
# Source: Microsoft 365 URLs and IP address ranges (official-endpoint-docs)
# Normalized source domain count: 12
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MICROSOFT-365-TO-OUTBOUND]
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:live.com" } on-error={}
:do { add name="microsoft365.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add name="msocdn.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add name="office.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add name="office365.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add name="outlook.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:outlook.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-MICROSOFT-365-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}
