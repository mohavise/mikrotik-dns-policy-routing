# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# script=update-reddit-outbound
# source-file=categories/social-media/reddit/output/list-all.rsc

/system script
:if ([:len [find name="update-reddit-outbound"]] > 0) do={ remove [find name="update-reddit-outbound"] }
add dont-require-permissions=no name=update-reddit-outbound owner=admin policy=read,write,policy,test source=":local fileName \"reddit-outbound.rsc\"
:local dnsBackup \"reddit-dns-backup-before-update.rsc\"
:local cidrBackup \"reddit-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/social-media/reddit/output/list-all.rsc\"
:local addrList \"DST-REDDIT-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove [find name=\$dnsBackup] }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove [find name=\$cidrBackup] }
:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"Reddit outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"Reddit outbound update: could not create address-list backup; stopping\"; :return }
:do { /tool fetch url=\$url dst-path=\$fileName mode=https } on-error={ :log warning \"Reddit outbound update: download failed; keeping old list\"; :return }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Reddit outbound update: downloaded file not found; keeping old list\"; :return }
:do { /import file-name=\$fileName } on-error={ :log error \"Reddit outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
:if ([:len [/ip dns static find address-list=\$addrList comment~\"reddit:\"]] = 0) do={ :log error \"Reddit outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
/file remove [find name=\$fileName]
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove [find name=\$dnsBackup] }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove [find name=\$cidrBackup] }
:log warning \"Reddit outbound update: completed successfully\"
"
