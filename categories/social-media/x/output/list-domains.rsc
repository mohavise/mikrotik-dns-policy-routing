# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# List: X domains
# RouterOS address-list: DST-X-TO-OUTBOUND
# Source: X-owned public domains (official-owned-domains)
# Last update: 2026-07-12 01:05:04 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-X-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)t\\.co\$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com\$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com\$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com\$" type=FWD address-list=DST-X-TO-OUTBOUND comment="x:x.com" } on-error={}
