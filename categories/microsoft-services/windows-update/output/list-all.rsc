# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# List: Windows Update combined domains + CIDR
# RouterOS address-list: DST-WINDOWS-UPDATE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:microsoft.com" } on-error={}
:do { add name="windowsupdate.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}

/ip firewall address-list
remove [find list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
