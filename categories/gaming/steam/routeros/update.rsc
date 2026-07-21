# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=steam
# script=update-steam-outbound
# source-file=categories/gaming/steam/output/list-all.rsc

/system script
:if ([:len [find name="update-steam-outbound"]] > 0) do={ remove [find name="update-steam-outbound"] }
add dont-require-permissions=no name=update-steam-outbound owner=admin policy=read,write,policy,test source=":local fileName \"steam-outbound.rsc\"
:local legacyLastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.steamusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/gaming/steam/output/list-all.rsc\"
:local addrList \"DST-steam-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$legacyLastGoodFile]] > 0) do={ /file remove [find name=\$legacyLastGoodFile] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"steam outbound update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"steam outbound update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"steam outbound update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"steam outbound update: syntax validation failed; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName } on-error={ :log error \"steam outbound update: import failed; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"steam outbound update: imported list is empty; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
/file remove [find name=\$fileName]
:log warning \"steam outbound update: completed successfully; downloaded file removed\""
