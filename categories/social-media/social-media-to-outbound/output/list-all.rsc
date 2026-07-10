# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=social-media-to-outbound
# List: social media combined domains + CIDR
# RouterOS address-list: DST-SOCIAL-MEDIA-TO-OUTBOUND
# Last update: 2026-07-10 10:38:32 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdninstagram\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list
remove [find list=DST-SOCIAL-MEDIA-TO-OUTBOUND]

/ip dns static
:do { add regexp="(^|.*\\.)facebook\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)t\\.co\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:x.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)licdn\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in\$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}

/ip firewall address-list

