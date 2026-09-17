# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat combined domains + CIDR
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-REDHAT-TO-OUTBOUND]
:do { add name="access.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:access.redhat.com" } on-error={}
:do { add name="cdn.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:cdn.redhat.com" } on-error={}
:do { add name="cloud.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:cloud.redhat.com" } on-error={}
:do { add name="console.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:console.redhat.com" } on-error={}
:do { add name="registry.access.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:registry.access.redhat.com" } on-error={}
:do { add name="registry.redhat.io" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:registry.redhat.io" } on-error={}
:do { add name="sso.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:sso.redhat.com" } on-error={}
:do { add name="subscription.rhn.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:subscription.rhn.redhat.com" } on-error={}
:do { add name="subscription.rhsm.redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:subscription.rhsm.redhat.com" } on-error={}

/ip firewall address-list
remove [find list=DST-REDHAT-TO-OUTBOUND]
