# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=design-to-outbound
# List: Design combined domains + CIDR
# RouterOS address-list: DST-DESIGN-TO-OUTBOUND
# Last update: 2026-07-05 14:04:00 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DESIGN-TO-OUTBOUND comment~"canva:"]
:do { add regexp="(^|.*\\.)canva\\.com\$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="canva:canva.com" } on-error={}
:do { add regexp="(^|.*\\.)canva-apps\\.com\$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}

/ip firewall address-list
remove [find list=DST-DESIGN-TO-OUTBOUND comment="canva-cidr"]

/ip dns static
remove [find address-list=DST-DESIGN-TO-OUTBOUND comment~"figma:"]
:do { add regexp="(^|.*\\.)figma\\.com\$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com\$" type=FWD address-list=DST-DESIGN-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-DESIGN-TO-OUTBOUND comment="figma-cidr"]

