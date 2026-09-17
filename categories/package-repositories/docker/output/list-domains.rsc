# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# List: Docker domains
# RouterOS address-list: DST-DOCKER-TO-OUTBOUND
# Source: Docker official allowlist (official-allowlist)
# Normalized source domain count: 12
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DOCKER-TO-OUTBOUND]
:do { add list=DST-DOCKER-TO-OUTBOUND address="docker.com" comment="docker:seed:docker.com" } on-error={}
:do { add list=DST-DOCKER-TO-OUTBOUND address="docker.io" comment="docker:seed:docker.io" } on-error={}

/ip dns static
remove [find address-list=DST-DOCKER-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)docker\\.com$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:dns:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:dns:docker.io" } on-error={}
