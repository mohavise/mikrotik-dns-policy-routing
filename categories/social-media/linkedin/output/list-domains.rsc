# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# List: LinkedIn domains
# RouterOS address-list: DST-LINKEDIN-TO-OUTBOUND
# Source: LinkedIn-owned public domains (official-owned-domains)
# Last update: 2026-07-09 10:40:40 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-LINKEDIN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)licdn\\.com\$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com\$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in\$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}
