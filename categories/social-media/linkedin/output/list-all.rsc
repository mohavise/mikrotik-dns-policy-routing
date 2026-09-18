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
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=103.20.92.0/22 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.0.0/23 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.8.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.10.0/23 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=108.174.13.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.9.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.12.0/22 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.16.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.23.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.177.0/24 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.178.0/23 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.180.0/22 comment="linkedin-cidr" } on-error={}
:do { add list=DST-LINKEDIN-TO-OUTBOUND address=144.2.185.0/24 comment="linkedin-cidr" } on-error={}
