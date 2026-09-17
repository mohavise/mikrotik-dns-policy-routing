# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# List: Docker domains
# RouterOS address-list: DST-DOCKER-TO-OUTBOUND
# Source: Docker official allowlist (official-allowlist)
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DOCKER-TO-OUTBOUND]
:do { add name="api.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:api.docker.com" } on-error={}
:do { add name="auth.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:auth.docker.com" } on-error={}
:do { add name="auth.docker.io" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:auth.docker.io" } on-error={}
:do { add name="desktop.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:desktop.docker.com" } on-error={}
:do { add name="docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add name="docker.io" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docker.io" } on-error={}
:do { add name="docs.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docs.docker.com" } on-error={}
:do { add name="download.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:download.docker.com" } on-error={}
:do { add name="hub.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:hub.docker.com" } on-error={}
:do { add name="login.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:login.docker.com" } on-error={}
:do { add name="production.cloudfront.docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:production.cloudfront.docker.com" } on-error={}
:do { add name="registry-1.docker.io" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:registry-1.docker.io" } on-error={}
