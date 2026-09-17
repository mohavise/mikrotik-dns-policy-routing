# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# List: Speedtest domains
# RouterOS address-list: SPEEDTEST
# Source: Local MikroTik DNS policy list (manual-curated)
# do-not-edit-manually

/ip dns static
remove [find address-list=SPEEDTEST]
:do { add name="bandwidthplace.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:bandwidthplace.com" } on-error={}
:do { add name="broadbandspeedchecker.co.uk" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:broadbandspeedchecker.co.uk" } on-error={}
:do { add name="dslreports.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:dslreports.com" } on-error={}
:do { add name="fast.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:fast.com" } on-error={}
:do { add name="librespeed.org" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:librespeed.org" } on-error={}
:do { add name="measurementlab.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:measurementlab.net" } on-error={}
:do { add name="mlab-ns.appspot.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:mlab-ns.appspot.com" } on-error={}
:do { add name="nperf.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:nperf.com" } on-error={}
:do { add name="ookla.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:ookla.com" } on-error={}
:do { add name="ooklaserver.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:ooklaserver.net" } on-error={}
:do { add name="openspeedtest.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:openspeedtest.com" } on-error={}
:do { add name="proof.ovh.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:proof.ovh.net" } on-error={}
:do { add name="speed.cloudflare.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speed.cloudflare.com" } on-error={}
:do { add name="speed.hetzner.de" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speed.hetzner.de" } on-error={}
:do { add name="speed.io" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speed.io" } on-error={}
:do { add name="speedcheck.org" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedcheck.org" } on-error={}
:do { add name="speedof.me" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedof.me" } on-error={}
:do { add name="speedsmart.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedsmart.net" } on-error={}
:do { add name="speedtest.att.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.att.com" } on-error={}
:do { add name="speedtest.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.com" } on-error={}
:do { add name="speedtest.frontier.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.frontier.com" } on-error={}
:do { add name="speedtest.googlefiber.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.googlefiber.net" } on-error={}
:do { add name="speedtest.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.net" } on-error={}
:do { add name="speedtest.tele2.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.tele2.net" } on-error={}
:do { add name="speedtest.verizon.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.verizon.com" } on-error={}
:do { add name="speedtest.xfinity.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtest.xfinity.com" } on-error={}
:do { add name="speedtestconfig.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtestconfig.com" } on-error={}
:do { add name="speedtestcustom.com" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:speedtestcustom.com" } on-error={}
:do { add name="testmy.net" type=FWD match-subdomain=yes address-list=SPEEDTEST comment="speedtest:testmy.net" } on-error={}
