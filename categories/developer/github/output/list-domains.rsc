# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# List: GitHub domains
# RouterOS address-list: DST-GITHUB-TO-OUTBOUND
# Source: GitHub-owned public/service domains (official-meta-and-owned-domains)
# Last update: 2026-07-11 00:57:20 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GITHUB-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)github\\.com\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com\$" type=FWD address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}
