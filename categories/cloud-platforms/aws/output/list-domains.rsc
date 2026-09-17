# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services domains
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# Source: AWS official website and console allowlist (official-control-plane-domains)
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AWS-TO-OUTBOUND]
:do { add name="aws.amazon.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:aws.amazon.com" } on-error={}
:do { add name="awsstatic.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add name="console.aws.a2z.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:console.aws.a2z.com" } on-error={}
:do { add name="opfcaptcha-prod.s3.amazonaws.com" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:opfcaptcha-prod.s3.amazonaws.com" } on-error={}
:do { add name="signin.aws" type=FWD match-subdomain=yes address-list=DST-AWS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}
