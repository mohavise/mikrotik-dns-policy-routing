# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services combined domains + CIDR
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# Domain source: AWS official website and console allowlist (official-control-plane-domains)
# Last update: 2026-07-16 00:56:30 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AWS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)aws\\.amazon\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:aws.amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.aws\\.a2z\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:console.aws.a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)opfcaptcha-prod\\.s3\\.amazonaws\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:opfcaptcha-prod.s3.amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list
remove [find list=DST-AWS-TO-OUTBOUND]
