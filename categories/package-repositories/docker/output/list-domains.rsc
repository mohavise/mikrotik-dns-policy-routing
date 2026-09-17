# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# List: Docker domains
# RouterOS address-list: DST-DOCKER-TO-OUTBOUND
# Source: Docker official allowlist (official-allowlist)
# Normalized source domain count: 12
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DOCKER-TO-OUTBOUND]
:do { add name="docker.com" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add name="docker.io" type=FWD match-subdomain=yes address-list=DST-DOCKER-TO-OUTBOUND comment="docker:docker.io" } on-error={}
