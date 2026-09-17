# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=youtube
# List: YouTube domains
# RouterOS address-list: DST-YOUTUBE-TO-OUTBOUND
# Source: YouTube public/service domains (official-google-service-domains)
# Normalized source domain count: 12
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-YOUTUBE-TO-OUTBOUND]
:do { add name="accounts.google.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:accounts.google.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add name="googlevideo.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add name="youtu.be" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add name="youtube-nocookie.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add name="ytimg.com" type=FWD match-subdomain=yes address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}
