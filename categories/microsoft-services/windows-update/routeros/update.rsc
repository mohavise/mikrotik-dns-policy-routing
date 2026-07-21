# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# script=update-windows-update-outbound
# source-file=categories/microsoft-services/windows-update/output/list-all.rsc

/system script
:if ([:len [find name="update-windows-update-outbound"]] > 0) do={ remove [find name="update-windows-update-outbound"] }
add dont-require-permissions=no name=update-windows-update-outbound owner=admin policy=read,write,policy,test source=":local fileName \"windows-update-outbound.rsc\"
:local lastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/microsoft-services/windows-update/output/list-all.rsc\"
:local addrList \"DST-WINDOWS-UPDATE-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Windows Update outbound update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Windows Update outbound update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"Windows Update outbound update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"Windows Update outbound update: syntax validation failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$lastGoodFile]] = 0) do={
    :do { /file copy \$fileName name=\$lastGoodFile } on-error={ /file remove [find name=\$fileName]; :log warning \"Windows Update outbound update: could not seed rollback payload; keeping old list\"; :return \"\" }
}
:do { /import file-name=\$fileName } on-error={ :log error \"Windows Update outbound update: import failed; restoring last-known-good list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /import file-name=\$lastGoodFile } on-error={ :log error \"Windows Update outbound update: last-known-good rollback failed\" }; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"Windows Update outbound update: imported list is empty; restoring last-known-good list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /import file-name=\$lastGoodFile } on-error={ :log error \"Windows Update outbound update: last-known-good rollback failed\" }; /file remove [find name=\$fileName]; :return \"\" }
:if ([:len [/file find name=\$lastGoodFile]] > 0) do={ /file remove [find name=\$lastGoodFile] }
:do { /file copy \$fileName name=\$lastGoodFile } on-error={ :log warning \"Windows Update outbound update: completed, but could not retain rollback payload\" }
/file remove [find name=\$fileName]
:log warning \"Windows Update outbound update: completed successfully\"
"