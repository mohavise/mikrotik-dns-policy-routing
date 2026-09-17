# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# List: LinkedIn domains
# RouterOS address-list: DST-LINKEDIN-TO-OUTBOUND
# Source: LinkedIn-owned public domains (official-owned-domains)
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-LINKEDIN-TO-OUTBOUND]
:do { add name="licdn.com" type=FWD match-subdomain=yes address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add name="linkedin.com" type=FWD match-subdomain=yes address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add name="lnkd.in" type=FWD match-subdomain=yes address-list=DST-LINKEDIN-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}
