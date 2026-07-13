# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# List: Amazon Web Services domains
# RouterOS address-list: DST-AWS-TO-OUTBOUND
# Source: AWS official website and console allowlist (official-control-plane-domains)
# Last update: 2026-07-13 11:50:56 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-AWS-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)aws\\.amazon\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:aws.amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.aws\\.a2z\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:console.aws.a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)opfcaptcha-prod\\.s3\\.amazonaws\\.com\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:opfcaptcha-prod.s3.amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws\$" type=FWD address-list=DST-AWS-TO-OUTBOUND comment="aws:signin.aws" } on-error={}
