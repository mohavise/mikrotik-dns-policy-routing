# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=spotify
# List: Spotify combined domains + CIDR
# RouterOS address-list: DST-SPOTIFY-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SPOTIFY-TO-OUTBOUND]
:do { add name="audio-ak-spotify-com.akamaized.net" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:audio-ak-spotify-com.akamaized.net" } on-error={}
:do { add name="audio4-ak-spotify-com.akamaized.net" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:audio4-ak-spotify-com.akamaized.net" } on-error={}
:do { add name="pscdn.co" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:pscdn.co" } on-error={}
:do { add name="scdn.co" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:scdn.co" } on-error={}
:do { add name="spotify.com" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:spotify.com" } on-error={}
:do { add name="spotifycdn.com" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:spotifycdn.com" } on-error={}
:do { add name="spotifycdn.net" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:spotifycdn.net" } on-error={}

/ip firewall address-list
remove [find list=DST-SPOTIFY-TO-OUTBOUND]
