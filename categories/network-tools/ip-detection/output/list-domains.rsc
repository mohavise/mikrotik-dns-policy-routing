# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# List: IP Detection domains
# RouterOS address-list: IP-DETECTION
# Source: Local MikroTik DNS policy list (manual-curated)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=IP-DETECTION]
:do { add name="browserleaks.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:browserleaks.com" } on-error={}
:do { add name="checkip.amazonaws.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:checkip.amazonaws.com" } on-error={}
:do { add name="dnsleaktest.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:dnsleaktest.com" } on-error={}
:do { add name="icanhazip.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:icanhazip.com" } on-error={}
:do { add name="ident.me" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ident.me" } on-error={}
:do { add name="ifconfig.co" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ifconfig.co" } on-error={}
:do { add name="ifconfig.me" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ifconfig.me" } on-error={}
:do { add name="ip-api.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ip-api.com" } on-error={}
:do { add name="ip.me" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ip.me" } on-error={}
:do { add name="ip.sb" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ip.sb" } on-error={}
:do { add name="ip2location.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ip2location.com" } on-error={}
:do { add name="ipaddress.my" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipaddress.my" } on-error={}
:do { add name="ipapi.co" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipapi.co" } on-error={}
:do { add name="ipapi.is" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipapi.is" } on-error={}
:do { add name="ipbase.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipbase.com" } on-error={}
:do { add name="ipchicken.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipchicken.com" } on-error={}
:do { add name="ipdata.co" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipdata.co" } on-error={}
:do { add name="ipecho.net" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipecho.net" } on-error={}
:do { add name="ipgeolocation.io" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipgeolocation.io" } on-error={}
:do { add name="ipify.org" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipify.org" } on-error={}
:do { add name="ipinfo.io" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipinfo.io" } on-error={}
:do { add name="ipleak.net" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipleak.net" } on-error={}
:do { add name="ipleak.org" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipleak.org" } on-error={}
:do { add name="iplocation.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:iplocation.com" } on-error={}
:do { add name="iplocation.net" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:iplocation.net" } on-error={}
:do { add name="ipquery.io" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipquery.io" } on-error={}
:do { add name="ipregistry.co" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipregistry.co" } on-error={}
:do { add name="ipstack.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipstack.com" } on-error={}
:do { add name="ipvoid.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipvoid.com" } on-error={}
:do { add name="ipwho.is" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipwho.is" } on-error={}
:do { add name="ipwhois.app" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:ipwhois.app" } on-error={}
:do { add name="myip.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:myip.com" } on-error={}
:do { add name="perfect-privacy.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:perfect-privacy.com" } on-error={}
:do { add name="seeip.org" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:seeip.org" } on-error={}
:do { add name="whatismyip.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:whatismyip.com" } on-error={}
:do { add name="whatismyip.host" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:whatismyip.host" } on-error={}
:do { add name="whatismyipaddress.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:whatismyipaddress.com" } on-error={}
:do { add name="whoer.net" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:whoer.net" } on-error={}
:do { add name="wtfismyip.com" type=FWD match-subdomain=yes address-list=IP-DETECTION comment="ip-detection:wtfismyip.com" } on-error={}
