# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=developer-to-outbound
# List: Developer combined domains + CIDR
# RouterOS address-list: DST-DEVELOPER-TO-OUTBOUND
# Last update: 2026-07-05 14:03:50 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DEVELOPER-TO-OUTBOUND comment~"github:"]
:do { add regexp="(^|.*\\.)github\\.com\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com\$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-DEVELOPER-TO-OUTBOUND comment="github-cidr"]

