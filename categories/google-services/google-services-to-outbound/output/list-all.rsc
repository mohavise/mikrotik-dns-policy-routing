# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=google-services-to-outbound
# List: google services combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-SERVICES-TO-OUTBOUND
# Last update: 2026-09-17 07:40:47 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND]
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="google-drive:gstatic.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-SERVICES-TO-OUTBOUND]

/ip dns static
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add name="googlevideo.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add name="youtu.be" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add name="youtube-nocookie.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add name="ytimg.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}

/ip firewall address-list

