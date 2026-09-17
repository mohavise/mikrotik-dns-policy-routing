# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat combined domains + CIDR
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-REDHAT-TO-OUTBOUND]
:do { add name="redhat.com" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:redhat.com" } on-error={}
:do { add name="redhat.io" type=FWD match-subdomain=yes address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:redhat.io" } on-error={}

/ip firewall address-list
remove [find list=DST-REDHAT-TO-OUTBOUND]
