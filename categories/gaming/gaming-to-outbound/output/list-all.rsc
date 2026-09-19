# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# List: gaming combined domains + CIDR
# RouterOS address-list: DST-GAMING-TO-OUTBOUND
# Last update: 2026-09-19 01:26:47 UTC
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
:do { add list=DST-GAMING-TO-OUTBOUND address=45.121.184.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=103.10.124.0/23 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=103.28.54.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=146.66.152.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=146.66.155.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.224.0/21 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.236.0/22 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.240.0/23 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.244.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.246.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.248.0/22 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.252.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=155.133.254.0/23 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=162.254.192.0/21 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=185.25.180.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=185.25.182.0/23 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=192.69.96.0/22 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=205.196.6.0/24 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=208.64.200.0/22 comment="gaming-to-outbound-cidr" } on-error={}
:do { add list=DST-GAMING-TO-OUTBOUND address=208.78.164.0/22 comment="gaming-to-outbound-cidr" } on-error={}

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
