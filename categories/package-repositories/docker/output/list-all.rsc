# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# List: Docker combined domains + CIDR
# RouterOS address-list: DST-DOCKER-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DOCKER-TO-OUTBOUND]
:do { add list=DST-DOCKER-TO-OUTBOUND address="docker.com" comment="docker:seed:docker.com" } on-error={}
:do { add list=DST-DOCKER-TO-OUTBOUND address="docker.io" comment="docker:seed:docker.io" } on-error={}

/ip dns static
remove [find address-list=DST-DOCKER-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)docker\\.com$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:dns:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:dns:docker.io" } on-error={}

/ip firewall address-list
