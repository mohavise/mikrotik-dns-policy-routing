# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# List: LinkedIn combined domains + CIDR
# RouterOS address-list: DST-LINKEDIN-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-LINKEDIN-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)licdn\\.com\$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com\$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in\$" type=FWD address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}

/ip firewall address-list
remove [find list=DST-LINKEDIN-TO-OUTBOUND]
