# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services combined domains + CIDR
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AWS-TO-OUTBOUND]
:do { add name="a2z.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:a2z.com" } on-error={}
:do { add name="amazon.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:amazon.com" } on-error={}
:do { add name="amazonaws.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:amazonaws.com" } on-error={}
:do { add name="awsstatic.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add name="signin.aws" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list
remove [find list=DST-AWS-TO-OUTBOUND]
