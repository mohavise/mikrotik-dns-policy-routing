# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# List: Windows Update domains
# RouterOS address-list: DST-WINDOWS-UPDATE-TO-OUTBOUND
# Source: Windows Update endpoint documentation (official-endpoint-docs)
# Normalized source domain count: 8
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:microsoft.com" } on-error={}
:do { add name="windowsupdate.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}
