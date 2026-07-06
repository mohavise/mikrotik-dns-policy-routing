# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=youtube
# List: YouTube domains
# RouterOS address-list: DST-YOUTUBE-TO-OUTBOUND
# Source: YouTube public/service domains (official-google-service-domains)
# Last update: 2026-07-06 12:26:23 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-YOUTUBE-TO-OUTBOUND comment~"youtube:"]
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googlevideo\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.youtube\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:m.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.youtube\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:www.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)youtu\\.be\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)youtubei\\.googleapis\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtubei.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)youtube-nocookie\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add regexp="(^|.*\\.)ytimg\\.com\$" type=FWD address-list=DST-YOUTUBE-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}
