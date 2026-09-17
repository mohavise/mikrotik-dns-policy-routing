# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma combined domains + CIDR
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FIGMA-TO-OUTBOUND]
:do { add name="figma.com" type=FWD match-subdomain=yes address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add name="figma.net" type=FWD match-subdomain=yes address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.net" } on-error={}
:do { add name="figma.site" type=FWD match-subdomain=yes address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.site" } on-error={}
:do { add name="figmausercontent.com" type=FWD match-subdomain=yes address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-FIGMA-TO-OUTBOUND]
