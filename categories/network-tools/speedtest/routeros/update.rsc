# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# script=update-speedtest-outbound
# source-file=categories/network-tools/speedtest/output/list-all.rsc

/system script
:if ([:len [find name="update-speedtest-outbound"]] > 0) do={ remove [find name="update-speedtest-outbound"] }
add dont-require-permissions=no name=update-speedtest-outbound owner=admin policy=read,write,policy,test source=":local fileName \"speedtest-outbound.rsc\"
:local legacyLastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/network-tools/speedtest/output/list-all.rsc\"
:local addrList \"SPEEDTEST\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$legacyLastGoodFile]] > 0) do={ /file remove [find name=\$legacyLastGoodFile] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Speedtest update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Speedtest update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"Speedtest update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"Speedtest update: syntax validation failed; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName } on-error={ :log error \"Speedtest update: import failed; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"Speedtest update: imported list is empty; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
/file remove [find name=\$fileName]
:log warning \"Speedtest update: completed successfully; downloaded file removed\""
