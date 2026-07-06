# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# List: Facebook combined domains + CIDR
# RouterOS address-list: DST-FACEBOOK-TO-OUTBOUND
# Domain source: Meta-owned Facebook public domains (official-owned-domains)
# Last update: 2026-07-06 11:32:18 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-FACEBOOK-TO-OUTBOUND comment~"facebook:"]
:do { add regexp="(^|.*\\.)facebook\\.com\$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com\$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net\$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com\$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me\$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com\$" type=FWD address-list=DST-FACEBOOK-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list
remove [find list=DST-FACEBOOK-TO-OUTBOUND comment="facebook-cidr"]
