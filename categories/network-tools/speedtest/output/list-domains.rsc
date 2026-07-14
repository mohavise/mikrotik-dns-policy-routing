# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# List: Speedtest domains
# RouterOS address-list: SPEEDTEST
# Source: Local MikroTik DNS policy list (manual-curated)
# Last update: 2026-07-14 00:53:34 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=SPEEDTEST]
:do { add regexp="(^|.*\\.)bandwidthplace\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:bandwidthplace.com" } on-error={}
:do { add regexp="(^|.*\\.)broadbandspeedchecker\\.co\\.uk\$" type=FWD address-list=SPEEDTEST comment="speedtest:broadbandspeedchecker.co.uk" } on-error={}
:do { add regexp="(^|.*\\.)dslreports\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:dslreports.com" } on-error={}
:do { add regexp="(^|.*\\.)fast\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:fast.com" } on-error={}
:do { add regexp="(^|.*\\.)librespeed\\.org\$" type=FWD address-list=SPEEDTEST comment="speedtest:librespeed.org" } on-error={}
:do { add regexp="(^|.*\\.)measurementlab\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:measurementlab.net" } on-error={}
:do { add regexp="(^|.*\\.)mlab-ns\\.appspot\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:mlab-ns.appspot.com" } on-error={}
:do { add regexp="(^|.*\\.)nperf\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:nperf.com" } on-error={}
:do { add regexp="(^|.*\\.)ookla\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:ookla.com" } on-error={}
:do { add regexp="(^|.*\\.)ooklaserver\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:ooklaserver.net" } on-error={}
:do { add regexp="(^|.*\\.)openspeedtest\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:openspeedtest.com" } on-error={}
:do { add regexp="(^|.*\\.)proof\\.ovh\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:proof.ovh.net" } on-error={}
:do { add regexp="(^|.*\\.)speed\\.cloudflare\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speed.cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)speed\\.hetzner\\.de\$" type=FWD address-list=SPEEDTEST comment="speedtest:speed.hetzner.de" } on-error={}
:do { add regexp="(^|.*\\.)speed\\.io\$" type=FWD address-list=SPEEDTEST comment="speedtest:speed.io" } on-error={}
:do { add regexp="(^|.*\\.)speedcheck\\.org\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedcheck.org" } on-error={}
:do { add regexp="(^|.*\\.)speedof\\.me\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedof.me" } on-error={}
:do { add regexp="(^|.*\\.)speedsmart\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedsmart.net" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.att\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.att.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.frontier\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.frontier.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.googlefiber\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.googlefiber.net" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.net" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.tele2\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.tele2.net" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.verizon\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.verizon.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtest\\.xfinity\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtest.xfinity.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtestconfig\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtestconfig.com" } on-error={}
:do { add regexp="(^|.*\\.)speedtestcustom\\.com\$" type=FWD address-list=SPEEDTEST comment="speedtest:speedtestcustom.com" } on-error={}
:do { add regexp="(^|.*\\.)testmy\\.net\$" type=FWD address-list=SPEEDTEST comment="speedtest:testmy.net" } on-error={}
