# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=social-media-to-outbound
# List: social media combined domains + CIDR
# RouterOS address-list: DST-SOCIAL-MEDIA-TO-OUTBOUND
# Last update: 2026-09-18 09:00:18 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="cdninstagram.com" comment="instagram:seed:cdninstagram.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="ig.me" comment="instagram:seed:ig.me" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="instagram.com" comment="instagram:seed:instagram.com" } on-error={}

/ip dns static
remove [find address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdninstagram\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:dns:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:dns:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:dns:instagram.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="facebook.com" comment="facebook:seed:facebook.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="fb.com" comment="facebook:seed:fb.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="fbcdn.net" comment="facebook:seed:fbcdn.net" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="fbsbx.com" comment="facebook:seed:fbsbx.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="m.me" comment="facebook:seed:m.me" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="messenger.com" comment="facebook:seed:messenger.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)facebook\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:dns:messenger.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="t.co" comment="x:seed:t.co" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="twimg.com" comment="x:seed:twimg.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="twitter.com" comment="x:seed:twitter.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="x.com" comment="x:seed:x.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)t\\.co$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:dns:x.com" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="licdn.com" comment="linkedin:seed:licdn.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="linkedin.com" comment="linkedin:seed:linkedin.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="lnkd.in" comment="linkedin:seed:lnkd.in" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)licdn\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:dns:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:dns:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:dns:lnkd.in" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="redd.it" comment="reddit:seed:redd.it" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="reddit.com" comment="reddit:seed:reddit.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="redditmedia.com" comment="reddit:seed:redditmedia.com" } on-error={}
:do { add list=DST-SOCIAL-MEDIA-TO-OUTBOUND address="redditstatic.com" comment="reddit:seed:redditstatic.com" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)redd\\.it$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:redd.it" } on-error={}
:do { add regexp="(^|.*\\.)reddit\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:reddit.com" } on-error={}
:do { add regexp="(^|.*\\.)redditmedia\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:redditmedia.com" } on-error={}
:do { add regexp="(^|.*\\.)redditstatic\\.com$" type=FWD address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:dns:redditstatic.com" } on-error={}

/ip firewall address-list

