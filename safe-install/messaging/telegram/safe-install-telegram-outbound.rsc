# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=telegram
# safe-install=telegram-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/messaging/telegram/routeros/update.rsc"
:local schedulerPath "categories/messaging/telegram/routeros/scheduler.rsc"
:local updateFile "update-telegram-outbound.rsc"
:local schedulerFile "scheduler-update-telegram-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Telegram outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Telegram outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-telegram-outbound
} on-error={
    :log error "Telegram outbound safe install: first update failed"
    :return
}

:log warning "Telegram outbound safe install: completed"
