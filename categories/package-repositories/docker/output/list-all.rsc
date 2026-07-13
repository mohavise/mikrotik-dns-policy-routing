# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# List: Docker combined domains + CIDR
# RouterOS address-list: DST-DOCKER-TO-OUTBOUND
# Domain source: Docker official allowlist (official-allowlist)
# Last update: 2026-07-13 01:05:35 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DOCKER-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)api\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:api.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)auth\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:auth.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)auth\\.docker\\.io\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:auth.docker.io" } on-error={}
:do { add regexp="(^|.*\\.)desktop\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:desktop.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docker.io" } on-error={}
:do { add regexp="(^|.*\\.)docs\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docs.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:download.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)hub\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:hub.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:login.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)production\\.cloudfront\\.docker\\.com\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:production.cloudfront.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)registry-1\\.docker\\.io\$" type=FWD address-list=DST-DOCKER-TO-OUTBOUND comment="docker:registry-1.docker.io" } on-error={}

/ip firewall address-list
remove [find list=DST-DOCKER-TO-OUTBOUND]
