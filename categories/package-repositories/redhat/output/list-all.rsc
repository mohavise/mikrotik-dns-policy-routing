# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# List: Red Hat combined domains + CIDR
# RouterOS address-list: DST-REDHAT-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-REDHAT-TO-OUTBOUND]
:do { add list=DST-REDHAT-TO-OUTBOUND address="redhat.com" comment="redhat:seed:redhat.com" } on-error={}
:do { add list=DST-REDHAT-TO-OUTBOUND address="redhat.io" comment="redhat:seed:redhat.io" } on-error={}

/ip dns static
remove [find address-list=DST-REDHAT-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)redhat\\.com$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:dns:redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)redhat\\.io$" type=FWD address-list=DST-REDHAT-TO-OUTBOUND comment="redhat:dns:redhat.io" } on-error={}

/ip firewall address-list
