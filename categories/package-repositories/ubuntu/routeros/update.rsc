# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# script=update-ubuntu-outbound
# source-file=categories/package-repositories/ubuntu/output/list-all.rsc

/system script
:if ([:len [find name="update-ubuntu-outbound"]] > 0) do={ remove [find name="update-ubuntu-outbound"] }
add dont-require-permissions=no name=update-ubuntu-outbound owner=admin policy=read,write,policy,test source=":local fileName \"ubuntu-outbound.rsc\"
:local dnsBackup \"ubuntu-dns-backup-before-update.rsc\"
:local cidrBackup \"ubuntu-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/package-repositories/ubuntu/output/list-all.rsc\"
:local addrList \"DST-UBUNTU-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove [find name=\$dnsBackup] }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove [find name=\$cidrBackup] }
:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"Ubuntu outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"Ubuntu outbound update: could not create address-list backup; stopping\"; :return }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Ubuntu outbound update: download failed; keeping old list\"; :return }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Ubuntu outbound update: downloaded file not found; keeping old list\"; :return }
:do { /import file-name=\$fileName } on-error={ :log error \"Ubuntu outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
:if ([:len [/ip dns static find address-list=\$addrList comment~\"ubuntu:\"]] = 0) do={ :log error \"Ubuntu outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
/file remove [find name=\$fileName]
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove [find name=\$dnsBackup] }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove [find name=\$cidrBackup] }
:log warning \"Ubuntu outbound update: completed successfully\"
"