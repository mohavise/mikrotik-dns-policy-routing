# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat combined domains + CIDR
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# Domain source: Red Hat RHSM firewall guidance (official-allowlist)
# Last update: 2026-07-19 01:01:57 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-REDHAT-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)access\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:access.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)cdn\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:cdn.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)cloud\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:cloud.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:console.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)registry\\.access\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:registry.access.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)registry\\.redhat\\.io\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:registry.redhat.io" } on-error={}
:do { add regexp="(^|.*\\.)sso\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:sso.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)subscription\\.rhn\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:subscription.rhn.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)subscription\\.rhsm\\.redhat\\.com\$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:subscription.rhsm.redhat.com" } on-error={}

/ip firewall address-list
remove [find list=DST-REDHAT-TO-OUTBOUND]
