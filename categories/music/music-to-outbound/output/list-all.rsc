# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=music-to-outbound
# List: music combined domains + CIDR
# RouterOS address-list: DST-MUSIC-TO-OUTBOUND
# Last update: 2026-07-24 00:55:58 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MUSIC-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)accounts\\.spotify\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:accounts.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)api\\.spotify\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:api.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)audio-ak-spotify-com\\.akamaized\\.net\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:audio-ak-spotify-com.akamaized.net" } on-error={}
:do { add regexp="(^|.*\\.)audio4-ak-spotify-com\\.akamaized\\.net\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:audio4-ak-spotify-com.akamaized.net" } on-error={}
:do { add regexp="(^|.*\\.)gew-spclient\\.spotify\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:gew-spclient.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)open\\.spotify\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:open.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)pscdn\\.co\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:pscdn.co" } on-error={}
:do { add regexp="(^|.*\\.)scdn\\.co\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:scdn.co" } on-error={}
:do { add regexp="(^|.*\\.)spclient\\.wg\\.spotify\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spclient.wg.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)spotify\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.com\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spotifycdn.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.net\$" type=FWD address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spotifycdn.net" } on-error={}

/ip firewall address-list
remove [find list=DST-MUSIC-TO-OUTBOUND]

