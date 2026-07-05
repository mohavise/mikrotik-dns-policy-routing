# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# script=update-instagram-outbound
# source-file=services/instagram/output/list-all.rsc

/system script
add dont-require-permissions=no name=update-instagram-outbound owner=admin policy=read,write,policy,test source=":local fileName \"instagram-outbound.rsc\"
:local dnsBackup \"instagram-dns-backup-before-update.rsc\"
:local cidrBackup \"instagram-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/instagram/output/list-all.rsc\"
:local addrList \"DST-INSTAGRAM-TO-OUTBOUND\"
:local minFileSize 300

:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove \$fileName }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }

:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"Instagram outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"Instagram outbound update: could not create address-list backup; stopping\"; :return }

:do { /tool fetch url=\$url dst-path=\$fileName mode=https } on-error={ :log warning \"Instagram outbound update: download failed; keeping old list\"; :return }

:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Instagram outbound update: downloaded file not found; keeping old list\"; :return }

:local fileSize [/file get [find name=\$fileName] size]
:if (\$fileSize < \$minFileSize) do={ :log warning (\"Instagram outbound update: downloaded file too small (\" . \$fileSize . \" bytes); keeping old list\"); /file remove \$fileName; :return }

:do { /import file-name=\$fileName } on-error={ :log error \"Instagram outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }

:if ([:len [/ip dns static find address-list=\$addrList comment~\"instagram:\"]] = 0) do={ :log error \"Instagram outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }

/file remove \$fileName
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }

:log warning \"Instagram outbound update: completed successfully\"
"

