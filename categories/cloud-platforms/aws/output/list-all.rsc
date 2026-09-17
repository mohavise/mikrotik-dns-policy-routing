# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services combined domains + CIDR
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-AWS-TO-OUTBOUND]
:do { add list=DST-AWS-TO-OUTBOUND address="a2z.com" comment="aws:seed:a2z.com" } on-error={}
:do { add list=DST-AWS-TO-OUTBOUND address="amazon.com" comment="aws:seed:amazon.com" } on-error={}
:do { add list=DST-AWS-TO-OUTBOUND address="amazonaws.com" comment="aws:seed:amazonaws.com" } on-error={}
:do { add list=DST-AWS-TO-OUTBOUND address="awsstatic.com" comment="aws:seed:awsstatic.com" } on-error={}
:do { add list=DST-AWS-TO-OUTBOUND address="signin.aws" comment="aws:seed:signin.aws" } on-error={}

/ip dns static
remove [find address-list=DST-AWS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)a2z\\.com$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:dns:a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)amazon\\.com$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:dns:amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)amazonaws\\.com$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:dns:amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:dns:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:dns:signin.aws" } on-error={}

/ip firewall address-list
