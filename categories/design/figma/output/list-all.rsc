# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma combined domains + CIDR
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-FIGMA-TO-OUTBOUND]
:do { add list=DST-FIGMA-TO-OUTBOUND address="figma.com" comment="figma:seed:figma.com" } on-error={}
:do { add list=DST-FIGMA-TO-OUTBOUND address="figma.net" comment="figma:seed:figma.net" } on-error={}
:do { add list=DST-FIGMA-TO-OUTBOUND address="figma.site" comment="figma:seed:figma.site" } on-error={}
:do { add list=DST-FIGMA-TO-OUTBOUND address="figmausercontent.com" comment="figma:seed:figmausercontent.com" } on-error={}

/ip dns static
remove [find address-list=DST-FIGMA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)figma\\.com$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:dns:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.net$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:dns:figma.net" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.site$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:dns:figma.site" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:dns:figmausercontent.com" } on-error={}

/ip firewall address-list
