# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# List: X domains
# RouterOS address-list: DST-X-TO-OUTBOUND
# Source: X-owned public domains (official-owned-domains)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-X-TO-OUTBOUND]
:do { add name="t.co" type=FWD match-subdomain=yes address-list=DST-X-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add name="twimg.com" type=FWD match-subdomain=yes address-list=DST-X-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add name="twitter.com" type=FWD match-subdomain=yes address-list=DST-X-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add name="x.com" type=FWD match-subdomain=yes address-list=DST-X-TO-OUTBOUND comment="x:x.com" } on-error={}
