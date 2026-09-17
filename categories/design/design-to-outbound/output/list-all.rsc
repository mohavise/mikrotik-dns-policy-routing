# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=design-to-outbound
# List: design combined domains + CIDR
# RouterOS address-list: DST-DESIGN-TO-OUTBOUND
# Last update: 2026-09-17 07:26:38 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DESIGN-TO-OUTBOUND]
:do { add name="figma.com" type=FWD match-subdomain=yes address-list=DST-DESIGN-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add name="figma.net" type=FWD match-subdomain=yes address-list=DST-DESIGN-TO-OUTBOUND comment="figma:figma.net" } on-error={}
:do { add name="figma.site" type=FWD match-subdomain=yes address-list=DST-DESIGN-TO-OUTBOUND comment="figma:figma.site" } on-error={}
:do { add name="figmausercontent.com" type=FWD match-subdomain=yes address-list=DST-DESIGN-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-DESIGN-TO-OUTBOUND]

/ip dns static
:do { add name="canva-apps.com" type=FWD match-subdomain=yes address-list=DST-DESIGN-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}
:do { add name="canva.com" type=FWD match-subdomain=yes address-list=DST-DESIGN-TO-OUTBOUND comment="canva:canva.com" } on-error={}

/ip firewall address-list

