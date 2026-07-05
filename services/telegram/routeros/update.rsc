# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=telegram
# script=update-telegram-outbound
# source-file=services/telegram/output/list-all.rsc

/system script
:if ([:len [find name="update-telegram-outbound"]] > 0) do={ remove [find name="update-telegram-outbound"] }
add dont-require-permissions=no name=update-telegram-outbound owner=admin policy=read,write,policy,test source=":local fileName \"telegram-outbound.rsc\"
:local dnsBackup \"telegram-dns-backup-before-update.rsc\"
:local cidrBackup \"telegram-cidr-backup-before-update.rsc\"
:local url \"https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/telegram/output/list-all.rsc\"
:local addrList \"DST-TELEGRAM-TO-OUTBOUND\"
:local minFileSize 1000

:if ([:len [/file find name=\$fileName]] > 0) do={ /file remove \$fileName }
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }

:do {
    /ip dns static export file=\$dnsBackup where address-list=\$addrList
} on-error={
    :log warning \"Telegram outbound update: could not create DNS backup; stopping\"
    :return
}

:do {
    /ip firewall address-list export file=\$cidrBackup where list=\$addrList
} on-error={
    :log warning \"Telegram outbound update: could not create address-list backup; stopping\"
    :return
}

:do {
    /tool fetch url=\$url dst-path=\$fileName mode=https
} on-error={
    :log warning \"Telegram outbound update: download failed; keeping old list\"
    :return
}

:if ([:len [/file find name=\$fileName]] = 0) do={
    :log warning \"Telegram outbound update: downloaded file not found; keeping old list\"
    :return
}

:local fileSize [/file get [find name=\$fileName] size]
:if (\$fileSize < \$minFileSize) do={
    :log warning (\"Telegram outbound update: downloaded file too small (\" . \$fileSize . \" bytes); keeping old list\")
    /file remove \$fileName
    :return
}

:do {
    /import file-name=\$fileName
} on-error={
    :log error \"Telegram outbound update: import failed; restoring backup\"
    :do { /import file-name=\$dnsBackup } on-error={ :log error \"Telegram outbound update: DNS backup restore failed\" }
    :do { /import file-name=\$cidrBackup } on-error={ :log error \"Telegram outbound update: CIDR backup restore failed\" }
    :return
}

:if ([:len [/ip firewall address-list find list=\$addrList comment=\"telegram-cidr\"]] = 0) do={
    :log error \"Telegram outbound update: Telegram CIDR list empty after import; restoring backup\"
    :do { /import file-name=\$dnsBackup } on-error={}
    :do { /import file-name=\$cidrBackup } on-error={}
    :return
}

/file remove \$fileName
:if ([:len [/file find name=\$dnsBackup]] > 0) do={ /file remove \$dnsBackup }
:if ([:len [/file find name=\$cidrBackup]] > 0) do={ /file remove \$cidrBackup }

:log warning \"Telegram outbound update: completed successfully\"
"
