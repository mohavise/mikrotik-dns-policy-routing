# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# List: IP Detection domains
# RouterOS address-list: IP-DETECTION
# Source: Local MikroTik DNS policy list (manual-curated)
# Last update: 2026-07-14 00:53:34 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=IP-DETECTION]
:do { add regexp="(^|.*\\.)browserleaks\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:browserleaks.com" } on-error={}
:do { add regexp="(^|.*\\.)checkip\\.amazonaws\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:checkip.amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)dnsleaktest\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:dnsleaktest.com" } on-error={}
:do { add regexp="(^|.*\\.)icanhazip\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:icanhazip.com" } on-error={}
:do { add regexp="(^|.*\\.)ident\\.me\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ident.me" } on-error={}
:do { add regexp="(^|.*\\.)ifconfig\\.co\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ifconfig.co" } on-error={}
:do { add regexp="(^|.*\\.)ifconfig\\.me\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ifconfig.me" } on-error={}
:do { add regexp="(^|.*\\.)ip-api\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ip-api.com" } on-error={}
:do { add regexp="(^|.*\\.)ip\\.me\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ip.me" } on-error={}
:do { add regexp="(^|.*\\.)ip\\.sb\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ip.sb" } on-error={}
:do { add regexp="(^|.*\\.)ip2location\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ip2location.com" } on-error={}
:do { add regexp="(^|.*\\.)ipaddress\\.my\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipaddress.my" } on-error={}
:do { add regexp="(^|.*\\.)ipapi\\.co\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipapi.co" } on-error={}
:do { add regexp="(^|.*\\.)ipapi\\.is\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipapi.is" } on-error={}
:do { add regexp="(^|.*\\.)ipbase\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipbase.com" } on-error={}
:do { add regexp="(^|.*\\.)ipchicken\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipchicken.com" } on-error={}
:do { add regexp="(^|.*\\.)ipdata\\.co\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipdata.co" } on-error={}
:do { add regexp="(^|.*\\.)ipecho\\.net\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipecho.net" } on-error={}
:do { add regexp="(^|.*\\.)ipgeolocation\\.io\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipgeolocation.io" } on-error={}
:do { add regexp="(^|.*\\.)ipify\\.org\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipify.org" } on-error={}
:do { add regexp="(^|.*\\.)ipinfo\\.io\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipinfo.io" } on-error={}
:do { add regexp="(^|.*\\.)ipleak\\.net\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipleak.net" } on-error={}
:do { add regexp="(^|.*\\.)ipleak\\.org\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipleak.org" } on-error={}
:do { add regexp="(^|.*\\.)iplocation\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:iplocation.com" } on-error={}
:do { add regexp="(^|.*\\.)iplocation\\.net\$" type=FWD address-list=IP-DETECTION comment="ip-detection:iplocation.net" } on-error={}
:do { add regexp="(^|.*\\.)ipquery\\.io\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipquery.io" } on-error={}
:do { add regexp="(^|.*\\.)ipregistry\\.co\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipregistry.co" } on-error={}
:do { add regexp="(^|.*\\.)ipstack\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipstack.com" } on-error={}
:do { add regexp="(^|.*\\.)ipvoid\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipvoid.com" } on-error={}
:do { add regexp="(^|.*\\.)ipwho\\.is\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipwho.is" } on-error={}
:do { add regexp="(^|.*\\.)ipwhois\\.app\$" type=FWD address-list=IP-DETECTION comment="ip-detection:ipwhois.app" } on-error={}
:do { add regexp="(^|.*\\.)myip\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:myip.com" } on-error={}
:do { add regexp="(^|.*\\.)perfect-privacy\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:perfect-privacy.com" } on-error={}
:do { add regexp="(^|.*\\.)seeip\\.org\$" type=FWD address-list=IP-DETECTION comment="ip-detection:seeip.org" } on-error={}
:do { add regexp="(^|.*\\.)whatismyip\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:whatismyip.com" } on-error={}
:do { add regexp="(^|.*\\.)whatismyip\\.host\$" type=FWD address-list=IP-DETECTION comment="ip-detection:whatismyip.host" } on-error={}
:do { add regexp="(^|.*\\.)whatismyipaddress\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:whatismyipaddress.com" } on-error={}
:do { add regexp="(^|.*\\.)whoer\\.net\$" type=FWD address-list=IP-DETECTION comment="ip-detection:whoer.net" } on-error={}
:do { add regexp="(^|.*\\.)wtfismyip\\.com\$" type=FWD address-list=IP-DETECTION comment="ip-detection:wtfismyip.com" } on-error={}
