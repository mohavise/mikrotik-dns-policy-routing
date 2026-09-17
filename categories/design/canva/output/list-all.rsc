# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# List: Canva combined domains + CIDR
# RouterOS address-list: DST-CANVA-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-CANVA-TO-OUTBOUND]
:do { add name="canva-apps.com" type=FWD match-subdomain=yes address-list=DST-CANVA-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}
:do { add name="canva.com" type=FWD match-subdomain=yes address-list=DST-CANVA-TO-OUTBOUND comment="canva:canva.com" } on-error={}

/ip firewall address-list
remove [find list=DST-CANVA-TO-OUTBOUND]
