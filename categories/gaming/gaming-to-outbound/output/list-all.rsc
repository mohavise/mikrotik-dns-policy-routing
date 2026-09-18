# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# List: gaming combined domains + CIDR
# RouterOS address-list: DST-GAMING-TO-OUTBOUND
# Last update: 2026-09-18 08:20:07 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-GAMING-TO-OUTBOUND]
:do { add list=DST-GAMING-TO-OUTBOUND address="akamaihd.net" comment="steam:seed:akamaihd.net" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steam-chat.com" comment="steam:seed:steam-chat.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steam.tv" comment="steam:seed:steam.tv" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steamcommunity.com" comment="steam:seed:steamcommunity.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steamcontent.com" comment="steam:seed:steamcontent.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steamgames.com" comment="steam:seed:steamgames.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steampowered.com" comment="steam:seed:steampowered.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steamserver.net" comment="steam:seed:steamserver.net" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steamstatic.com" comment="steam:seed:steamstatic.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="steamusercontent.com" comment="steam:seed:steamusercontent.com" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address="valvesoftware.com" comment="steam:seed:valvesoftware.com" } on-error={}

/ip dns static
remove [find address-list=DST-GAMING-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)akamaihd\\.net$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)steam-chat\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steam-chat.com" } on-error={}
:do { add regexp="(^|.*\\.)steam\\.tv$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steam.tv" } on-error={}
:do { add regexp="(^|.*\\.)steamcommunity\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steamcommunity.com" } on-error={}
:do { add regexp="(^|.*\\.)steamcontent\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steamcontent.com" } on-error={}
:do { add regexp="(^|.*\\.)steamgames\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steamgames.com" } on-error={}
:do { add regexp="(^|.*\\.)steampowered\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)steamserver\\.net$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steamserver.net" } on-error={}
:do { add regexp="(^|.*\\.)steamstatic\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steamstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)steamusercontent\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:steamusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)valvesoftware\\.com$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:dns:valvesoftware.com" } on-error={}

/ip firewall address-list

