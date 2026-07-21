# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# script=update-gaming-outbound
# source-file=categories/gaming/gaming-to-outbound/output/list-all.rsc

/system script
:if ([:len [find name="update-gaming-outbound"]] > 0) do={ remove [find name="update-gaming-outbound"] }
add dont-require-permissions=no name=update-gaming-outbound owner=admin policy=read,write,policy,test source=":local fileName \"gaming-outbound.rsc\"
:local legacyLastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/gaming/gaming-to-outbound/output/list-all.rsc\"
:local addrList \"DST-GAMING-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$legacyLastGoodFile]] > 0) do={ /file remove [find name=\$legacyLastGoodFile] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Gaming outbound update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Gaming outbound update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"Gaming outbound update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"Gaming outbound update: syntax validation failed; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName } on-error={ :log error \"Gaming outbound update: import failed; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"Gaming outbound update: imported list is empty; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
/file remove [find name=\$fileName]
:log warning \"Gaming outbound update: completed successfully; downloaded file removed\""
