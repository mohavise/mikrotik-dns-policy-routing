# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat domains
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# Source: Red Hat RHSM firewall guidance (official-allowlist)
# Normalized source domain count: 9
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-REDHAT-TO-OUTBOUND]
:do { add list=DST-REDHAT-TO-OUTBOUND address="redhat.com" comment="redhat:seed:redhat.com" } on-error={}
:do { add list=DST-REDHAT-TO-OUTBOUND address="redhat.io" comment="redhat:seed:redhat.io" } on-error={}

/ip dns static
remove [find address-list=DST-REDHAT-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)redhat\\.com$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:dns:redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)redhat\\.io$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:dns:redhat.io" } on-error={}
