# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# script=update-gaming-outbound
# source-file=profiles/gaming-to-outbound/output/list-all.rsc

/system script
:if ([:len [find name="update-gaming-outbound"]] > 0) do={ remove [find name="update-gaming-outbound"] }
add dont-require-permissions=no name=update-gaming-outbound owner=admin policy=read,write,policy,test source=":local fileName \"gaming-outbound.rsc\"
:local dnsBackup \"developer-dns-backup-before-update.rsc\"
:local cidrBackup \"developer-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/profiles/gaming-to-outbound/output/list-all.rsc\"
:local addrList \"DST-GAMING-TO-OUTBOUND\"
:local minFileSize 900
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove \$fileName }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }
:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"Gaming outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"Gaming outbound update: could not create address-list backup; stopping\"; :return }
:do { /tool fetch url=\$url dst-path=\$fileName mode=https } on-error={ :log warning \"Gaming outbound update: download failed; keeping old list\"; :return }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Gaming outbound update: downloaded file not found; keeping old list\"; :return }
:local fileSize [/file get [find name=\$fileName] size]
:if (\$fileSize < \$minFileSize) do={ :log warning (\"Gaming outbound update: downloaded file too small (\" . \$fileSize . \" bytes); keeping old list\"); /file remove \$fileName; :return }
:do { /import file-name=\$fileName } on-error={ :log error \"Gaming outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
:if ([:len [/ip dns static find address-list=\$addrList]] = 0) do={ :log error \"Gaming outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
/file remove \$fileName
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }
:log warning \"Gaming outbound update: completed successfully\"
"

