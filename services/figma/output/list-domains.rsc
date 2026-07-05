# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma domains
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# Source: Figma-owned public/service domains (official-owned-domains)
# Last update: 2026-07-05 12:03:17 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FIGMA-TO-OUTBOUND comment~"figma:"]
:do { add regexp="(^|.*\\.)figma\\.com\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}
