# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-drive
# List: Google Drive combined domains + CIDR
# RouterOS address-list: DST-GOOGLE-DRIVE-TO-OUTBOUND
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND comment="google-drive:gstatic.com" } on-error={}

/ip firewall address-list
remove [find list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
