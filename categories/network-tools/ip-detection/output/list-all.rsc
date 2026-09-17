# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# List: IP Detection combined domains + CIDR
# RouterOS address-list: IP-DETECTION
# do-not-edit-manually

/ip firewall address-list
remove [find list=IP-DETECTION]
:do { add list=IP-DETECTION address="amazonaws.com" comment="ip-detection:seed:amazonaws.com" } on-error={}
:do { add list=IP-DETECTION address="browserleaks.com" comment="ip-detection:seed:browserleaks.com" } on-error={}
:do { add list=IP-DETECTION address="dnsleaktest.com" comment="ip-detection:seed:dnsleaktest.com" } on-error={}
:do { add list=IP-DETECTION address="icanhazip.com" comment="ip-detection:seed:icanhazip.com" } on-error={}
:do { add list=IP-DETECTION address="ident.me" comment="ip-detection:seed:ident.me" } on-error={}
:do { add list=IP-DETECTION address="ifconfig.co" comment="ip-detection:seed:ifconfig.co" } on-error={}
:do { add list=IP-DETECTION address="ifconfig.me" comment="ip-detection:seed:ifconfig.me" } on-error={}
:do { add list=IP-DETECTION address="ip-api.com" comment="ip-detection:seed:ip-api.com" } on-error={}
:do { add list=IP-DETECTION address="ip.me" comment="ip-detection:seed:ip.me" } on-error={}
:do { add list=IP-DETECTION address="ip.sb" comment="ip-detection:seed:ip.sb" } on-error={}
:do { add list=IP-DETECTION address="ip2location.com" comment="ip-detection:seed:ip2location.com" } on-error={}
:do { add list=IP-DETECTION address="ipaddress.my" comment="ip-detection:seed:ipaddress.my" } on-error={}
:do { add list=IP-DETECTION address="ipapi.co" comment="ip-detection:seed:ipapi.co" } on-error={}
:do { add list=IP-DETECTION address="ipapi.is" comment="ip-detection:seed:ipapi.is" } on-error={}
:do { add list=IP-DETECTION address="ipbase.com" comment="ip-detection:seed:ipbase.com" } on-error={}
:do { add list=IP-DETECTION address="ipchicken.com" comment="ip-detection:seed:ipchicken.com" } on-error={}
:do { add list=IP-DETECTION address="ipdata.co" comment="ip-detection:seed:ipdata.co" } on-error={}
:do { add list=IP-DETECTION address="ipecho.net" comment="ip-detection:seed:ipecho.net" } on-error={}
:do { add list=IP-DETECTION address="ipgeolocation.io" comment="ip-detection:seed:ipgeolocation.io" } on-error={}
:do { add list=IP-DETECTION address="ipify.org" comment="ip-detection:seed:ipify.org" } on-error={}
:do { add list=IP-DETECTION address="ipinfo.io" comment="ip-detection:seed:ipinfo.io" } on-error={}
:do { add list=IP-DETECTION address="ipleak.net" comment="ip-detection:seed:ipleak.net" } on-error={}
:do { add list=IP-DETECTION address="ipleak.org" comment="ip-detection:seed:ipleak.org" } on-error={}
:do { add list=IP-DETECTION address="iplocation.com" comment="ip-detection:seed:iplocation.com" } on-error={}
:do { add list=IP-DETECTION address="iplocation.net" comment="ip-detection:seed:iplocation.net" } on-error={}
:do { add list=IP-DETECTION address="ipquery.io" comment="ip-detection:seed:ipquery.io" } on-error={}
:do { add list=IP-DETECTION address="ipregistry.co" comment="ip-detection:seed:ipregistry.co" } on-error={}
:do { add list=IP-DETECTION address="ipstack.com" comment="ip-detection:seed:ipstack.com" } on-error={}
:do { add list=IP-DETECTION address="ipvoid.com" comment="ip-detection:seed:ipvoid.com" } on-error={}
:do { add list=IP-DETECTION address="ipwho.is" comment="ip-detection:seed:ipwho.is" } on-error={}
:do { add list=IP-DETECTION address="ipwhois.app" comment="ip-detection:seed:ipwhois.app" } on-error={}
:do { add list=IP-DETECTION address="myip.com" comment="ip-detection:seed:myip.com" } on-error={}
:do { add list=IP-DETECTION address="perfect-privacy.com" comment="ip-detection:seed:perfect-privacy.com" } on-error={}
:do { add list=IP-DETECTION address="seeip.org" comment="ip-detection:seed:seeip.org" } on-error={}
:do { add list=IP-DETECTION address="whatismyip.com" comment="ip-detection:seed:whatismyip.com" } on-error={}
:do { add list=IP-DETECTION address="whatismyip.host" comment="ip-detection:seed:whatismyip.host" } on-error={}
:do { add list=IP-DETECTION address="whatismyipaddress.com" comment="ip-detection:seed:whatismyipaddress.com" } on-error={}
:do { add list=IP-DETECTION address="whoer.net" comment="ip-detection:seed:whoer.net" } on-error={}
:do { add list=IP-DETECTION address="wtfismyip.com" comment="ip-detection:seed:wtfismyip.com" } on-error={}

/ip dns static
remove [find address-list=IP-DETECTION]
:do { add regexp="(^|.*\\.)amazonaws\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)browserleaks\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:browserleaks.com" } on-error={}
:do { add regexp="(^|.*\\.)dnsleaktest\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:dnsleaktest.com" } on-error={}
:do { add regexp="(^|.*\\.)icanhazip\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:icanhazip.com" } on-error={}
:do { add regexp="(^|.*\\.)ident\\.me$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ident.me" } on-error={}
:do { add regexp="(^|.*\\.)ifconfig\\.co$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ifconfig.co" } on-error={}
:do { add regexp="(^|.*\\.)ifconfig\\.me$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ifconfig.me" } on-error={}
:do { add regexp="(^|.*\\.)ip-api\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ip-api.com" } on-error={}
:do { add regexp="(^|.*\\.)ip\\.me$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ip.me" } on-error={}
:do { add regexp="(^|.*\\.)ip\\.sb$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ip.sb" } on-error={}
:do { add regexp="(^|.*\\.)ip2location\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ip2location.com" } on-error={}
:do { add regexp="(^|.*\\.)ipaddress\\.my$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipaddress.my" } on-error={}
:do { add regexp="(^|.*\\.)ipapi\\.co$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipapi.co" } on-error={}
:do { add regexp="(^|.*\\.)ipapi\\.is$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipapi.is" } on-error={}
:do { add regexp="(^|.*\\.)ipbase\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipbase.com" } on-error={}
:do { add regexp="(^|.*\\.)ipchicken\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipchicken.com" } on-error={}
:do { add regexp="(^|.*\\.)ipdata\\.co$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipdata.co" } on-error={}
:do { add regexp="(^|.*\\.)ipecho\\.net$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipecho.net" } on-error={}
:do { add regexp="(^|.*\\.)ipgeolocation\\.io$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipgeolocation.io" } on-error={}
:do { add regexp="(^|.*\\.)ipify\\.org$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipify.org" } on-error={}
:do { add regexp="(^|.*\\.)ipinfo\\.io$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipinfo.io" } on-error={}
:do { add regexp="(^|.*\\.)ipleak\\.net$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipleak.net" } on-error={}
:do { add regexp="(^|.*\\.)ipleak\\.org$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipleak.org" } on-error={}
:do { add regexp="(^|.*\\.)iplocation\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:iplocation.com" } on-error={}
:do { add regexp="(^|.*\\.)iplocation\\.net$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:iplocation.net" } on-error={}
:do { add regexp="(^|.*\\.)ipquery\\.io$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipquery.io" } on-error={}
:do { add regexp="(^|.*\\.)ipregistry\\.co$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipregistry.co" } on-error={}
:do { add regexp="(^|.*\\.)ipstack\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipstack.com" } on-error={}
:do { add regexp="(^|.*\\.)ipvoid\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipvoid.com" } on-error={}
:do { add regexp="(^|.*\\.)ipwho\\.is$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipwho.is" } on-error={}
:do { add regexp="(^|.*\\.)ipwhois\\.app$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:ipwhois.app" } on-error={}
:do { add regexp="(^|.*\\.)myip\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:myip.com" } on-error={}
:do { add regexp="(^|.*\\.)perfect-privacy\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:perfect-privacy.com" } on-error={}
:do { add regexp="(^|.*\\.)seeip\\.org$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:seeip.org" } on-error={}
:do { add regexp="(^|.*\\.)whatismyip\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:whatismyip.com" } on-error={}
:do { add regexp="(^|.*\\.)whatismyip\\.host$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:whatismyip.host" } on-error={}
:do { add regexp="(^|.*\\.)whatismyipaddress\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:whatismyipaddress.com" } on-error={}
:do { add regexp="(^|.*\\.)whoer\\.net$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:whoer.net" } on-error={}
:do { add regexp="(^|.*\\.)wtfismyip\\.com$" type=FWD address-list=IP-DETECTION comment="ip-detection:dns:wtfismyip.com" } on-error={}

/ip firewall address-list
