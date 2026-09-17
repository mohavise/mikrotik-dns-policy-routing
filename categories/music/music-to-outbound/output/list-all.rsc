# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=music-to-outbound
# List: music combined domains + CIDR
# RouterOS address-list: DST-MUSIC-TO-OUTBOUND
# Last update: 2026-09-17 07:51:12 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MUSIC-TO-OUTBOUND]
:do { add name="akamaized.net" type=FWD match-subdomain=yes address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:akamaized.net" } on-error={}
:do { add name="pscdn.co" type=FWD match-subdomain=yes address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:pscdn.co" } on-error={}
:do { add name="scdn.co" type=FWD match-subdomain=yes address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:scdn.co" } on-error={}
:do { add name="spotify.com" type=FWD match-subdomain=yes address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spotify.com" } on-error={}
:do { add name="spotifycdn.com" type=FWD match-subdomain=yes address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spotifycdn.com" } on-error={}
:do { add name="spotifycdn.net" type=FWD match-subdomain=yes address-list=DST-MUSIC-TO-OUTBOUND comment="spotify:spotifycdn.net" } on-error={}

/ip firewall address-list
remove [find list=DST-MUSIC-TO-OUTBOUND]

