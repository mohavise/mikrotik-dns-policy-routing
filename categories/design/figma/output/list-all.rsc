# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma combined domains + CIDR
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# Domain source: Figma-owned public/service domains (official-owned-domains)
# Last update: 2026-07-06 16:00:06 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FIGMA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)figma\\.com\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-FIGMA-TO-OUTBOUND]
