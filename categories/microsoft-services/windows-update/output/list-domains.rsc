# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# List: Windows Update domains
# RouterOS address-list: DST-WINDOWS-UPDATE-TO-OUTBOUND
# Source: Windows Update endpoint documentation (official-endpoint-docs)
# Normalized source domain count: 8
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
:do { add name="delivery.mp.microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:delivery.mp.microsoft.com" } on-error={}
:do { add name="emdl.ws.microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:emdl.ws.microsoft.com" } on-error={}
:do { add name="prod.do.dsp.mp.microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:prod.do.dsp.mp.microsoft.com" } on-error={}
:do { add name="tsfe.trafficshaping.dsp.mp.microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:tsfe.trafficshaping.dsp.mp.microsoft.com" } on-error={}
:do { add name="update.microsoft.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:update.microsoft.com" } on-error={}
:do { add name="windowsupdate.com" type=FWD match-subdomain=yes address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}
