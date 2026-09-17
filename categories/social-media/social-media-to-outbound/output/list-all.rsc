# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=social-media-to-outbound
# List: social media combined domains + CIDR
# RouterOS address-list: DST-SOCIAL-MEDIA-TO-OUTBOUND
# Last update: 2026-09-17 07:51:12 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
:do { add name="cdninstagram.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add name="ig.me" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add name="instagram.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list
remove [find list=DST-SOCIAL-MEDIA-TO-OUTBOUND]

/ip dns static
:do { add name="facebook.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add name="fb.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add name="fbcdn.net" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add name="fbsbx.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add name="m.me" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add name="messenger.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="t.co" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add name="twimg.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add name="twitter.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add name="x.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="x:x.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="licdn.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add name="linkedin.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add name="lnkd.in" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="redd.it" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:redd.it" } on-error={}
:do { add name="reddit.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:reddit.com" } on-error={}
:do { add name="redditmedia.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:redditmedia.com" } on-error={}
:do { add name="redditstatic.com" type=FWD match-subdomain=yes address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND comment="reddit:redditstatic.com" } on-error={}

/ip firewall address-list

