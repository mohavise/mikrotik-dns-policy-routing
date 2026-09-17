# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# List: LinkedIn combined domains + CIDR
# RouterOS address-list: DST-LINKEDIN-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-LINKEDIN-TO-OUTBOUND]
:do { add list=DST-LINKEDIN-TO-OUTBOUND address="licdn.com" comment="linkedin:seed:licdn.com" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address="linkedin.com" comment="linkedin:seed:linkedin.com" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address="lnkd.in" comment="linkedin:seed:lnkd.in" } on-error={}

/ip dns static
remove [find address-list=DST-LINKEDIN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)licdn\\.com$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:dns:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:dns:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:dns:lnkd.in" } on-error={}

/ip firewall address-list
