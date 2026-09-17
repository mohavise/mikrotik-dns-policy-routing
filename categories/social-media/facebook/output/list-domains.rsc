# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# List: Facebook domains
# RouterOS address-list: DST-FACEBOOK-TO-OUTBOUND
# Source: Meta-owned Facebook public domains (official-owned-domains)
# Normalized source domain count: 6
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FACEBOOK-TO-OUTBOUND]
:do { add name="facebook.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add name="fb.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add name="fbcdn.net" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add name="fbsbx.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add name="m.me" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add name="messenger.com" type=FWD match-subdomain=yes address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}
