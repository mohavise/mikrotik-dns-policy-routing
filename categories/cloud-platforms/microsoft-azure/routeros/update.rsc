# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# script=update-microsoft-azure-outbound
# source-file=categories/cloud-platforms/microsoft-azure/output/list-all.rsc

/system script
:if ([:len [find name="update-microsoft-azure-outbound"]] > 0) do={ remove [find name="update-microsoft-azure-outbound"] }
add dont-require-permissions=no name=update-microsoft-azure-outbound owner=admin policy=read,write,policy,test source=":local fileName \"microsoft-azure-outbound.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/cloud-platforms/microsoft-azure/output/list-all.rsc\"
:local addrList \"DST-MICROSOFT-AZURE-TO-OUTBOUND\"
:local backupList (\$addrList . \"-UPDATE-BACKUP\")
:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove [find name=\$fileName] }
:do { /tool fetch url=\$url dst-path=\$fileName check-certificate=yes-without-crl } on-error={ :log warning \"Microsoft Azure outbound update: download failed; keeping old list\"; :return \"\" }
:if ([:len [/file find name=\$fileName]] = 0) do={ :log warning \"Microsoft Azure outbound update: downloaded file not found; keeping old list\"; :return \"\" }
:local payload [/file get [find name=\$fileName] contents]
:if (([:len \$payload] = 0) || ([:find \$payload \$addrList] = nil)) do={ /file remove [find name=\$fileName]; :log warning \"Microsoft Azure outbound update: downloaded file failed validation; keeping old list\"; :return \"\" }
:if (([:len [/ip dns static find address-list=\$backupList]] > 0) || ([:len [/ip firewall address-list find list=\$backupList]] > 0)) do={
    :if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={
        /ip dns static set [find address-list=\$backupList] address-list=\$addrList
        /ip firewall address-list set [find list=\$backupList] list=\$addrList
    } else={
        /ip dns static remove [find address-list=\$backupList]
        /ip firewall address-list remove [find list=\$backupList]
    }
}
:do {
    /ip dns static set [find address-list=\$addrList] address-list=\$backupList
    /ip firewall address-list set [find list=\$addrList] list=\$backupList
} on-error={ :log error \"Microsoft Azure outbound update: could not stage current list; restoring\"; :do { /ip dns static set [find address-list=\$backupList] address-list=\$addrList } on-error={}; :do { /ip firewall address-list set [find list=\$backupList] list=\$addrList } on-error={}; /file remove [find name=\$fileName]; :return \"\" }
:do { /import file-name=\$fileName } on-error={ :log error \"Microsoft Azure outbound update: import failed; restoring old list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /ip dns static set [find address-list=\$backupList] address-list=\$addrList } on-error={}; :do { /ip firewall address-list set [find list=\$backupList] list=\$addrList } on-error={}; /file remove [find name=\$fileName]; :return \"\" }
:if (([:len [/ip dns static find address-list=\$addrList]] = 0) && ([:len [/ip firewall address-list find list=\$addrList]] = 0)) do={ :log error \"Microsoft Azure outbound update: imported list is empty; restoring old list\"; :do { /ip dns static remove [find address-list=\$addrList] } on-error={}; :do { /ip firewall address-list remove [find list=\$addrList] } on-error={}; :do { /ip dns static set [find address-list=\$backupList] address-list=\$addrList } on-error={}; :do { /ip firewall address-list set [find list=\$backupList] list=\$addrList } on-error={}; /file remove [find name=\$fileName]; :return \"\" }
/ip dns static remove [find address-list=\$backupList]
/ip firewall address-list remove [find list=\$backupList]
/file remove [find name=\$fileName]
:log warning \"Microsoft Azure outbound update: completed successfully\"
"