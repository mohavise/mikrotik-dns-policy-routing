# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# List: Windows Update domains
# RouterOS address-list: DST-WINDOWS-UPDATE-TO-OUTBOUND
# Source: Windows Update endpoint documentation (official-endpoint-docs)
# Normalized source domain count: 8
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
:do { add list=DST-WINDOWS-UPDATE-TO-OUTBOUND address="microsoft.com" comment="windows-update:seed:microsoft.com" } on-error={}
:do { add list=DST-WINDOWS-UPDATE-TO-OUTBOUND address="windowsupdate.com" comment="windows-update:seed:windowsupdate.com" } on-error={}

/ip dns static
remove [find address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)microsoft\\.com$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:dns:microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)windowsupdate\\.com$" type=FWD address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:dns:windowsupdate.com" } on-error={}
