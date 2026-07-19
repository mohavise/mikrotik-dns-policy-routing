# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# script=update-docker-outbound
# source-file=categories/package-repositories/docker/output/list-all.rsc

/system script
:if ([:len [find name="update-docker-outbound"]] > 0) do={ remove [find name="update-docker-outbound"] }
add dont-require-permissions=no name=update-docker-outbound owner=admin policy=read,write,policy,test source=":local fileName \"docker-outbound.rsc\"
:local dnsBackup \"docker-dns-backup-before-update.rsc\"
:local cidrBackup \"docker-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/package-repositories/docker/output/list-all.rsc\"
:local addrList \"DST-DOCKER-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove [find name=\$dnsBackup] }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove [find name=\$cidrBackup] }
:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"Docker outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"Docker outbound update: could not create address-list backup; stopping\"; :return }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Docker outbound update: download failed; keeping old list\"; :return }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Docker outbound update: downloaded file not found; keeping old list\"; :return }
:do { /import file-name=\$fileName } on-error={ :log error \"Docker outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
:if ([:len [/ip dns static find address-list=\$addrList comment~\"docker:\"]] = 0) do={ :log error \"Docker outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
/file remove [find name=\$fileName]
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove [find name=\$dnsBackup] }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove [find name=\$cidrBackup] }
:log warning \"Docker outbound update: completed successfully\"
"