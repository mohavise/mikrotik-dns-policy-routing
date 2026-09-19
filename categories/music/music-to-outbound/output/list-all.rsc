# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=music-to-outbound
# List: music combined domains + CIDR
# RouterOS address-list: DST-MUSIC-TO-OUTBOUND
# Last update: 2026-09-19 01:26:47 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MUSIC-TO-OUTBOUND]
:do { add list=DST-MUSIC-TO-OUTBOUND address="akamaized.net" comment="spotify:seed:akamaized.net" } on-error={}
:do { add list=DST-MUSIC-TO-OUTBOUND address="pscdn.co" comment="spotify:seed:pscdn.co" } on-error={}
:do { add list=DST-MUSIC-TO-OUTBOUND address="scdn.co" comment="spotify:seed:scdn.co" } on-error={}
:do { add list=DST-MUSIC-TO-OUTBOUND address="spotify.com" comment="spotify:seed:spotify.com" } on-error={}
:do { add list=DST-MUSIC-TO-OUTBOUND address="spotifycdn.com" comment="spotify:seed:spotifycdn.com" } on-error={}
:do { add list=DST-MUSIC-TO-OUTBOUND address="spotifycdn.net" comment="spotify:seed:spotifycdn.net" } on-error={}

/ip dns static
remove [find address-list=DST-MUSIC-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)akamaized\\.net$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:dns:akamaized.net" } on-error={}
:do { add regexp="(^|.*\\.)pscdn\\.co$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:dns:pscdn.co" } on-error={}
:do { add regexp="(^|.*\\.)scdn\\.co$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:dns:scdn.co" } on-error={}
:do { add regexp="(^|.*\\.)spotify\\.com$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:dns:spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.com$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:dns:spotifycdn.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.net$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:dns:spotifycdn.net" } on-error={}
