# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# List: Reddit domains
# RouterOS address-list: DST-REDDIT-TO-OUTBOUND
# Source: Reddit first-party service and media domains (official-owned-domains)
# Normalized source domain count: 4
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-REDDIT-TO-OUTBOUND]
:do { add list=DST-REDDIT-TO-OUTBOUND address="redd.it" comment="reddit:seed:redd.it" } on-error={}
:do { add list=DST-REDDIT-TO-OUTBOUND address="reddit.com" comment="reddit:seed:reddit.com" } on-error={}
:do { add list=DST-REDDIT-TO-OUTBOUND address="redditmedia.com" comment="reddit:seed:redditmedia.com" } on-error={}
:do { add list=DST-REDDIT-TO-OUTBOUND address="redditstatic.com" comment="reddit:seed:redditstatic.com" } on-error={}

/ip dns static
remove [find address-list=DST-REDDIT-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)redd\\.it$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:dns:redd.it" } on-error={}
:do { add regexp="(^|.*\\.)reddit\\.com$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:dns:reddit.com" } on-error={}
:do { add regexp="(^|.*\\.)redditmedia\\.com$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:dns:redditmedia.com" } on-error={}
:do { add regexp="(^|.*\\.)redditstatic\\.com$" type=FWD address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:dns:redditstatic.com" } on-error={}
