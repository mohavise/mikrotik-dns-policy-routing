# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# List: gaming combined domains + CIDR
# RouterOS address-list: DST-GAMING-TO-OUTBOUND
# Last update: 2026-07-21 08:55:13 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GAMING-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)help\\.steampowered\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:help.steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)steam-chat\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steam-chat.com" } on-error={}
:do { add regexp="(^|.*\\.)steam\\.tv\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steam.tv" } on-error={}
:do { add regexp="(^|.*\\.)steamcdn-a\\.akamaihd\\.net\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamcdn-a.akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)steamcommunity\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamcommunity.com" } on-error={}
:do { add regexp="(^|.*\\.)steamcontent\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamcontent.com" } on-error={}
:do { add regexp="(^|.*\\.)steamgames\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamgames.com" } on-error={}
:do { add regexp="(^|.*\\.)steampowered\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)steamserver\\.net\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamserver.net" } on-error={}
:do { add regexp="(^|.*\\.)steamstatic\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)steamstore-a\\.akamaihd\\.net\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamstore-a.akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)steamusercontent\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)steamuserimages-a\\.akamaihd\\.net\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:steamuserimages-a.akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)store\\.steampowered\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:store.steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)valvesoftware\\.com\$" type=FWD address-list=DST-GAMING-TO-OUTBOUND comment="steam:valvesoftware.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GAMING-TO-OUTBOUND]

