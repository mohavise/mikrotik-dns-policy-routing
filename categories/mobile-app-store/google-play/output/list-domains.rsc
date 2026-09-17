# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# List: Google Play domains
# RouterOS address-list: DST-GOOGLE-PLAY-TO-OUTBOUND
# Source: Android Enterprise Network Requirements (official-vendor-docs)
# Normalized source domain count: 43
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-PLAY-TO-OUTBOUND]
:do { add name="android.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add name="google-analytics.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add name="gvt1.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add name="gvt2.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add name="gvt3.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add name="pki.goog" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:pki.goog" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-PLAY-TO-OUTBOUND comment="google-play:youtube.com" } on-error={}
