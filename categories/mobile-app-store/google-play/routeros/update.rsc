# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# script=update-google-play-outbound
# source-file=categories/mobile-app-store/google-play/output/list-all.rsc

/system script
:if ([:len [find name="update-google-play-outbound"]] > 0) do={ remove [find name="update-google-play-outbound"] }
add dont-require-permissions=no name=update-google-play-outbound owner=admin policy=read,write,policy,test source=":local fileName \"google-play-outbound.rsc\"
:local legacyLastGoodFile (\"last-good-\" . \$fileName)
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/mobile-app-store/google-play/output/list-all.rsc\"
:local addrList \"DST-GOOGLE-PLAY-TO-OUTBOUND\"
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:if ([:len [/file find name=\$legacyLastGoodFile]] > 0) do={ /file remove [find name=\$legacyLastGoodFile] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Google Play outbound update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Google Play outbound update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"Google Play outbound update: downloaded file failed validation; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName verbose=yes dry-run } on-error={ /file remove [find name=\$fileName]; :log warning \"Google Play outbound update: syntax validation failed; keeping old list\"; :return \"\" }
:do { /import file-name=\$fileName } on-error={ :log error \"Google Play outbound update: import failed; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"Google Play outbound update: imported list is empty; downloaded file removed\"; /file remove [find name=\$fileName]; :return \"\" }
/file remove [find name=\$fileName]
:log warning \"Google Play outbound update: completed successfully; downloaded file removed\""
