# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# List: Reddit combined domains + CIDR
# RouterOS address-list: DST-REDDIT-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-REDDIT-TO-OUTBOUND]
:do { add name="redd.it" type=FWD match-subdomain=yes address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:redd.it" } on-error={}
:do { add name="reddit.com" type=FWD match-subdomain=yes address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:reddit.com" } on-error={}
:do { add name="redditmedia.com" type=FWD match-subdomain=yes address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:redditmedia.com" } on-error={}
:do { add name="redditstatic.com" type=FWD match-subdomain=yes address-list=DST-REDDIT-TO-OUTBOUND comment="reddit:redditstatic.com" } on-error={}

/ip firewall address-list
remove [find list=DST-REDDIT-TO-OUTBOUND]
