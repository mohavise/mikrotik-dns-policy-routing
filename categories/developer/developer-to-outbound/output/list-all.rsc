# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=developer-to-outbound
# List: developer combined domains + CIDR
# RouterOS address-list: DST-DEVELOPER-TO-OUTBOUND
# Last update: 2026-09-18 08:19:09 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DEVELOPER-TO-OUTBOUND]
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="github.com" comment="github:seed:github.com" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="github.dev" comment="github:seed:github.dev" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="github.io" comment="github:seed:github.io" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="githubapp.com" comment="github:seed:githubapp.com" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="githubassets.com" comment="github:seed:githubassets.com" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="githubcopilot.com" comment="github:seed:githubcopilot.com" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="githubstatus.com" comment="github:seed:githubstatus.com" } on-error={}
:do { add list=DST-DEVELOPER-TO-OUTBOUND address="githubusercontent.com" comment="github:seed:githubusercontent.com" } on-error={}

/ip dns static
remove [find address-list=DST-DEVELOPER-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)github\\.com$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com$" type=FWD address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:dns:githubusercontent.com" } on-error={}

/ip firewall address-list

