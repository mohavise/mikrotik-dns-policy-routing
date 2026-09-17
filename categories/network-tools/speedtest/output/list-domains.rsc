# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# List: Speedtest domains
# RouterOS address-list: SPEEDTEST
# Source: Local MikroTik DNS policy list (manual-curated)
# Normalized source domain count: 29
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=SPEEDTEST]
:do { add list=SPEEDTEST address="appspot.com" comment="speedtest:seed:appspot.com" } on-error={}
:do { add list=SPEEDTEST address="att.com" comment="speedtest:seed:att.com" } on-error={}
:do { add list=SPEEDTEST address="bandwidthplace.com" comment="speedtest:seed:bandwidthplace.com" } on-error={}
:do { add list=SPEEDTEST address="broadbandspeedchecker.co.uk" comment="speedtest:seed:broadbandspeedchecker.co.uk" } on-error={}
:do { add list=SPEEDTEST address="cloudflare.com" comment="speedtest:seed:cloudflare.com" } on-error={}
:do { add list=SPEEDTEST address="dslreports.com" comment="speedtest:seed:dslreports.com" } on-error={}
:do { add list=SPEEDTEST address="fast.com" comment="speedtest:seed:fast.com" } on-error={}
:do { add list=SPEEDTEST address="frontier.com" comment="speedtest:seed:frontier.com" } on-error={}
:do { add list=SPEEDTEST address="googlefiber.net" comment="speedtest:seed:googlefiber.net" } on-error={}
:do { add list=SPEEDTEST address="hetzner.de" comment="speedtest:seed:hetzner.de" } on-error={}
:do { add list=SPEEDTEST address="librespeed.org" comment="speedtest:seed:librespeed.org" } on-error={}
:do { add list=SPEEDTEST address="measurementlab.net" comment="speedtest:seed:measurementlab.net" } on-error={}
:do { add list=SPEEDTEST address="nperf.com" comment="speedtest:seed:nperf.com" } on-error={}
:do { add list=SPEEDTEST address="ookla.com" comment="speedtest:seed:ookla.com" } on-error={}
:do { add list=SPEEDTEST address="ooklaserver.net" comment="speedtest:seed:ooklaserver.net" } on-error={}
:do { add list=SPEEDTEST address="openspeedtest.com" comment="speedtest:seed:openspeedtest.com" } on-error={}
:do { add list=SPEEDTEST address="ovh.net" comment="speedtest:seed:ovh.net" } on-error={}
:do { add list=SPEEDTEST address="speed.io" comment="speedtest:seed:speed.io" } on-error={}
:do { add list=SPEEDTEST address="speedcheck.org" comment="speedtest:seed:speedcheck.org" } on-error={}
:do { add list=SPEEDTEST address="speedof.me" comment="speedtest:seed:speedof.me" } on-error={}
:do { add list=SPEEDTEST address="speedsmart.net" comment="speedtest:seed:speedsmart.net" } on-error={}
:do { add list=SPEEDTEST address="speedtest.com" comment="speedtest:seed:speedtest.com" } on-error={}
:do { add list=SPEEDTEST address="speedtest.net" comment="speedtest:seed:speedtest.net" } on-error={}
:do { add list=SPEEDTEST address="speedtestconfig.com" comment="speedtest:seed:speedtestconfig.com" } on-error={}
:do { add list=SPEEDTEST address="speedtestcustom.com" comment="speedtest:seed:speedtestcustom.com" } on-error={}
:do { add list=SPEEDTEST address="tele2.net" comment="speedtest:seed:tele2.net" } on-error={}
:do { add list=SPEEDTEST address="testmy.net" comment="speedtest:seed:testmy.net" } on-error={}
:do { add list=SPEEDTEST address="verizon.com" comment="speedtest:seed:verizon.com" } on-error={}
:do { add list=SPEEDTEST address="xfinity.com" comment="speedtest:seed:xfinity.com" } on-error={}

/ip dns static
remove [find address-list=SPEEDTEST]
:do { add regexp="(^|.*\\.)appspot\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:appspot.com" } on-error={}
:do { add regexp="(^|.*\\.)att\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:att.com" } on-error={}
:do { add regexp="(^|.*\\.)bandwidthplace\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:bandwidthplace.com" } on-error={}
:do { add regexp="(^|.*\\.)broadbandspeedchecker\\.co\\.uk$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:broadbandspeedchecker.co.uk" } on-error={}
:do { add regexp="(^|.*\\.)cloudflare\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)dslreports\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:dslreports.com" } on-error={}
:do { add regexp="(^|.*\\.)fast\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:fast.com" } on-error={}
:do { add regexp="(^|.*\\.)frontier\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:frontier.com" } on-error={}
:do { add regexp="(^|.*\\.)googlefiber\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:googlefiber.net" } on-error={}
:do { add regexp="(^|.*\\.)hetzner\\.de$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:hetzner.de" } on-error={}
:do { add regexp="(^|.*\\.)librespeed\\.org$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:librespeed.org" } on-error={}
:do { add regexp="(^|.*\\.)measurementlab\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:measurementlab.net" } on-error={}
:do { add regexp="(^|.*\\.)nperf\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:nperf.com" } on-error={}
:do { add regexp="(^|.*\\.)ookla\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:ookla.com" } on-error={}
:do { add regexp="(^|.*\\.)ooklaserver\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:ooklaserver.net" } on-error={}
:do { add regexp="(^|.*\\.)openspeedtest\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:openspeedtest.com" } on-error={}
:do { add regexp="(^|.*\\.)ovh\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:ovh.net" } on-error={}
:do { add regexp="(^|.*\\.)speed\\.io$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speed.io" } on-error={}
:do { add regexp="(^|.*\\.)speedcheck\\.org$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedcheck.org" } on-error={}
:do { add regexp="(^|.*\\.)speedof\\.me$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedof.me" } on-error={}
:do { add regexp="(^|.*\\.)speedsmart\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedsmart.net" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedtest.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedtest.net" } on-error={}
:do { add regexp="(^|.*\\.)speedtestconfig\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedtestconfig.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtestcustom\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:speedtestcustom.com" } on-error={}
:do { add regexp="(^|.*\\.)tele2\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:tele2.net" } on-error={}
:do { add regexp="(^|.*\\.)testmy\\.net$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:testmy.net" } on-error={}
:do { add regexp="(^|.*\\.)verizon\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:verizon.com" } on-error={}
:do { add regexp="(^|.*\\.)xfinity\\.com$" type=FWD address-list=SPEEDTEST comment="speedtest:dns:xfinity.com" } on-error={}
