# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# List: GitHub domains
# RouterOS address-list: DST-GITHUB-TO-OUTBOUND
# Source: GitHub-owned public/service domains (official-meta-and-owned-domains)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GITHUB-TO-OUTBOUND]
:do { add name="github.com" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add name="github.dev" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add name="github.io" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add name="githubapp.com" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add name="githubassets.com" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add name="githubcopilot.com" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add name="githubstatus.com" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add name="githubusercontent.com" type=FWD match-subdomain=yes address-list=DST-GITHUB-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}
