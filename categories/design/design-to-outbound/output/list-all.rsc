# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=design-to-outbound
# List: design combined domains + CIDR
# RouterOS address-list: DST-DESIGN-TO-OUTBOUND
# Last update: 2026-09-17 18:37:11 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DESIGN-TO-OUTBOUND]
:do { add list=DST-DESIGN-TO-OUTBOUND address="figma.com" comment="figma:seed:figma.com" } on-error={}
:do { add list=DST-DESIGN-TO-OUTBOUND address="figma.net" comment="figma:seed:figma.net" } on-error={}
:do { add list=DST-DESIGN-TO-OUTBOUND address="figma.site" comment="figma:seed:figma.site" } on-error={}
:do { add list=DST-DESIGN-TO-OUTBOUND address="figmausercontent.com" comment="figma:seed:figmausercontent.com" } on-error={}

/ip dns static
remove [find address-list=DST-DESIGN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)figma\\.com$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="figma:dns:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.net$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="figma:dns:figma.net" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.site$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="figma:dns:figma.site" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="figma:dns:figmausercontent.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-DESIGN-TO-OUTBOUND address="canva-apps.com" comment="canva:seed:canva-apps.com" } on-error={}
:do { add list=DST-DESIGN-TO-OUTBOUND address="canva.com" comment="canva:seed:canva.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)canva-apps\\.com$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="canva:dns:canva-apps.com" } on-error={}
:do { add regexp="(^|.*\\.)canva\\.com$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="canva:dns:canva.com" } on-error={}

/ip firewall address-list

