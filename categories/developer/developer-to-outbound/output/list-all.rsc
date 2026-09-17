# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=developer-to-outbound
# List: developer combined domains + CIDR
# RouterOS address-list: DST-DEVELOPER-TO-OUTBOUND
# Last update: 2026-09-17 07:51:11 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DEVELOPER-TO-OUTBOUND]
:do { add name="github.com" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add name="github.dev" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add name="github.io" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add name="githubapp.com" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add name="githubassets.com" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add name="githubcopilot.com" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add name="githubstatus.com" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add name="githubusercontent.com" type=FWD match-subdomain=yes address-list=DST-DEVELOPER-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-DEVELOPER-TO-OUTBOUND]

