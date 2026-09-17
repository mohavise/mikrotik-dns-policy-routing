# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=steam
# List: Steam combined domains + CIDR
# RouterOS address-list: DST-STEAM-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-STEAM-TO-OUTBOUND]
:do { add name="steam-chat.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steam-chat.com" } on-error={}
:do { add name="steam.tv" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steam.tv" } on-error={}
:do { add name="steamcdn-a.akamaihd.net" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamcdn-a.akamaihd.net" } on-error={}
:do { add name="steamcommunity.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamcommunity.com" } on-error={}
:do { add name="steamcontent.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamcontent.com" } on-error={}
:do { add name="steamgames.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamgames.com" } on-error={}
:do { add name="steampowered.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steampowered.com" } on-error={}
:do { add name="steamserver.net" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamserver.net" } on-error={}
:do { add name="steamstatic.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamstatic.com" } on-error={}
:do { add name="steamstore-a.akamaihd.net" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamstore-a.akamaihd.net" } on-error={}
:do { add name="steamusercontent.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamusercontent.com" } on-error={}
:do { add name="steamuserimages-a.akamaihd.net" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:steamuserimages-a.akamaihd.net" } on-error={}
:do { add name="valvesoftware.com" type=FWD match-subdomain=yes address-list=DST-STEAM-TO-OUTBOUND comment="steam:valvesoftware.com" } on-error={}

/ip firewall address-list
remove [find list=DST-STEAM-TO-OUTBOUND]
