# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# script=update-figma-outbound
# source-file=services/figma/output/list-all.rsc

/system script
:if ([:len [find name="update-figma-outbound"]] > 0) do={ remove [find name="update-figma-outbound"] }
add dont-require-permissions=no name=update-figma-outbound owner=admin policy=read,write,policy,test source=":local fileName \"figma-outbound.rsc\"
:local dnsBackup \"figma-dns-backup-before-update.rsc\"
:local cidrBackup \"figma-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/figma/output/list-all.rsc\"
:local addrList \"DST-FIGMA-TO-OUTBOUND\"
:local minFileSize 300
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove \$fileName }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }
:do { /ip dns static export file=\$dnsBackup where address-list=\$addrList } on-error={ :log warning \"Figma outbound update: could not create DNS backup; stopping\"; :return }
:do { /ip firewall address-list export file=\$cidrBackup where list=\$addrList } on-error={ :log warning \"Figma outbound update: could not create address-list backup; stopping\"; :return }
:do { /tool fetch url=\$url dst-path=\$fileName mode=https } on-error={ :log warning \"Figma outbound update: download failed; keeping old list\"; :return }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Figma outbound update: downloaded file not found; keeping old list\"; :return }
:local fileSize [/file get [find name=\$fileName] size]
:if (\$fileSize < \$minFileSize) do={ :log warning (\"Figma outbound update: downloaded file too small (\" . \$fileSize . \" bytes); keeping old list\"); /file remove \$fileName; :return }
:do { /import file-name=\$fileName } on-error={ :log error \"Figma outbound update: import failed; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
:if ([:len [/ip dns static find address-list=\$addrList comment~\"figma:\"]] = 0) do={ :log error \"Figma outbound update: domain list empty after import; restoring backup\"; :do { /import file-name=\$dnsBackup } on-error={}; :do { /import file-name=\$cidrBackup } on-error={}; :return }
/file remove \$fileName
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }
:log warning \"Figma outbound update: completed successfully\"
"

