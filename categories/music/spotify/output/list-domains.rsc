# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=spotify
# List: Spotify domains
# RouterOS address-list: DST-SPOTIFY-TO-OUTBOUND
# Source: Spotify public/service domains (official-owned-domains)
# Normalized source domain count: 12
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-SPOTIFY-TO-OUTBOUND]
:do { add name="akamaized.net" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:akamaized.net" } on-error={}
:do { add name="pscdn.co" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:pscdn.co" } on-error={}
:do { add name="scdn.co" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:scdn.co" } on-error={}
:do { add name="spotify.com" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:spotify.com" } on-error={}
:do { add name="spotifycdn.com" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:spotifycdn.com" } on-error={}
:do { add name="spotifycdn.net" type=FWD match-subdomain=yes address-list=DST-SPOTIFY-TO-OUTBOUND comment="spotify:spotifycdn.net" } on-error={}
