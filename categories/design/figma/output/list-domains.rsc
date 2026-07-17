# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# List: Figma domains
# RouterOS address-list: DST-FIGMA-TO-OUTBOUND
# Source: Figma public/service domains with observed required app domains (official-and-observed-domains)
# Last update: 2026-07-17 01:02:08 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FIGMA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)figma\\.com\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.net\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.net" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.site\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figma.site" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com\$" type=FWD address-list=DST-FIGMA-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}
