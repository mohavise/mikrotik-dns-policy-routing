# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# List: Reddit domains
# RouterOS address-list: DST-REDDIT-TO-OUTBOUND
# Source: Reddit first-party service and media domains (official-owned-domains)
# Last update: 2026-07-15 00:51:09 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-REDDIT-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)redd\\.it\$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:redd.it" } on-error={}
:do { add regexp="(^|.*\\.)reddit\\.com\$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:reddit.com" } on-error={}
:do { add regexp="(^|.*\\.)redditmedia\\.com\$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:redditmedia.com" } on-error={}
:do { add regexp="(^|.*\\.)redditstatic\\.com\$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:redditstatic.com" } on-error={}
