# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services domains
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# Source: AWS official website and console allowlist (official-control-plane-domains)
# Normalized source domain count: 5
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AWS-TO-OUTBOUND]
:do { add name="a2z.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:a2z.com" } on-error={}
:do { add name="amazon.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:amazon.com" } on-error={}
:do { add name="amazonaws.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:amazonaws.com" } on-error={}
:do { add name="awsstatic.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add name="signin.aws" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}
