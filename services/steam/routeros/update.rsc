# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=steam
# script=update-steam-outbound
# source-file=services/steam/output/list-all.rsc

/system script
:if ([:len [find name="update-steam-outbound"]] > 0) do={ remove [find name="update-steam-outbound"] }
add dont-require-permissions=no name=update-steam-outbound owner=admin policy=read,write,policy,test source=":local fileName \"steam-outbound.rsc\"
:local dnsBackup \"steam-dns-backup-before-update.rsc\"
:local cidrBackup \"steam-cidr-backup-before-update.rsc\"
:local url \"https://raw.steamusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/steam/output/list-all.rsc\"
:local addrList \"DST-steam-TO-OUTBOUND\"
:local minFileSize 1200
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove \$fileName }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }
:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"steam outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"steam outbound update: could not create address-list backup; stopping\"; :return }
:do { /tool fetch url=\$url dst-path=\$fileName mode=https } on-error={ :log warning \"steam outbound update: download failed; keeping old list\"; :return }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"steam outbound update: downloaded file not found; keeping old list\"; :return }
:local fileSize [/file get [find name=\$fileName] size]
:if (\$fileSize < \$minFileSize) do={ :log warning (\"steam outbound update: downloaded file too small (\" . \$fileSize . \" bytes); keeping old list\"); /file remove \$fileName; :return }
:do { /import file-name=\$fileName } on-error={ :log error \"steam outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
:if ([:len [/ip dns static find address-list=\$addrList comment~\"steam:\"]] = 0) do={ :log error \"steam outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
/file remove \$fileName
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }
:log warning \"steam outbound update: completed successfully\"
"

