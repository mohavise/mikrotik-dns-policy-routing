# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# script=update-instagram-outbound
# source-file=categories/social-media/instagram/output/list-all.rsc

/system script
:if ([:len [find name="update-instagram-outbound"]] > 0) do={ remove [find name="update-instagram-outbound"] }
add dont-require-permissions=no name=update-instagram-outbound owner=admin policy=read,write,policy,test source=":local fileName \"instagram-outbound.rsc\"
:local lastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/social-media/instagram/output/list-all.rsc\"
:local addrList \"DST-INSTAGRAM-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Instagram outbound update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Instagram outbound update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"Instagram outbound update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"Instagram outbound update: syntax validation failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$lastGoodFile]] = 0) do={
    :do { /file copy \$fileName name=\$lastGoodFile } on-error={ /file remove [find name=\$fileName]; :log warning \"Instagram outbound update: could not seed rollback payload; keeping old list\"; :return \"\" }
}
:do { /import file-name=\$fileName } on-error={ :log error \"Instagram outbound update: import failed; restoring last-known-good list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /import file-name=\$lastGoodFile } on-error={ :log error \"Instagram outbound update: last-known-good rollback failed\" }; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"Instagram outbound update: imported list is empty; restoring last-known-good list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /import file-name=\$lastGoodFile } on-error={ :log error \"Instagram outbound update: last-known-good rollback failed\" }; /file remove [find name=\$fileName]; :return \"\" }
:if ([:len [/file find name=\$lastGoodFile]] > 0) do={ /file remove [find name=\$lastGoodFile] }
:do { /file copy \$fileName name=\$lastGoodFile } on-error={ :log warning \"Instagram outbound update: completed, but could not retain rollback payload\" }
/file remove [find name=\$fileName]
:log warning \"Instagram outbound update: completed successfully\"
"