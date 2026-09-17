# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=youtube
# List: YouTube domains
# RouterOS address-list: DST-YOUTUBE-TO-OUTBOUND
# Source: YouTube public/service domains (official-google-service-domains)
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-YOUTUBE-TO-OUTBOUND]
:do { add name="accounts.google.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:accounts.google.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add name="googlevideo.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add name="m.youtube.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:m.youtube.com" } on-error={}
:do { add name="www.youtube.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:www.youtube.com" } on-error={}
:do { add name="youtu.be" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add name="youtube-nocookie.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add name="youtubei.googleapis.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtubei.googleapis.com" } on-error={}
:do { add name="ytimg.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}
