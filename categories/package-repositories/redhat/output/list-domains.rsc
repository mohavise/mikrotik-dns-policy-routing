# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat domains
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# Source: Red Hat RHSM firewall guidance (official-allowlist)
# Normalized source domain count: 9
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-REDHAT-TO-OUTBOUND]
:do { add name="redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:redhat.com" } on-error={}
:do { add name="redhat.io" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:redhat.io" } on-error={}
