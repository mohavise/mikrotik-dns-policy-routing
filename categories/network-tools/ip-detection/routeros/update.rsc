# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# script=update-ip-detection-outbound
# source-file=categories/network-tools/ip-detection/output/list-all.rsc

/system script
:if ([:len [find name="update-ip-detection-outbound"]] > 0) do={ remove [find name="update-ip-detection-outbound"] }
add dont-require-permissions=no name=update-ip-detection-outbound owner=admin policy=read,write,policy,test source=":local fileName \"ip-detection-outbound.rsc\"
:local lastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/network-tools/ip-detection/output/list-all.rsc\"
:local addrList \"IP-DETECTION\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"IP Detection update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"IP Detection update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"IP Detection update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"IP Detection update: syntax validation failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$lastGoodFile]] = 0) do={
    :do { /file copy \$fileName name=\$lastGoodFile } on-error={ /file remove [find name=\$fileName]; :log warning \"IP Detection update: could not seed rollback payload; keeping old list\"; :return \"\" }
}
:do { /import file-name=\$fileName } on-error={ :log error \"IP Detection update: import failed; restoring last-known-good list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /import file-name=\$lastGoodFile } on-error={ :log error \"IP Detection update: last-known-good rollback failed\" }; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"IP Detection update: imported list is empty; restoring last-known-good list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /import file-name=\$lastGoodFile } on-error={ :log error \"IP Detection update: last-known-good rollback failed\" }; /file remove [find name=\$fileName]; :return \"\" }
:if ([:len [/file find name=\$lastGoodFile]] > 0) do={ /file remove [find name=\$lastGoodFile] }
:do { /file copy \$fileName name=\$lastGoodFile } on-error={ :log warning \"IP Detection update: completed, but could not retain rollback payload\" }
/file remove [find name=\$fileName]
:log warning \"IP Detection update: completed successfully\"
"