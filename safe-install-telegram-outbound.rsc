# Project: MikroTik DNS Policy Routing
# Maintainer: mohavise
# Safe install: Telegram outbound updater + scheduler

:local updateFile "update-telegram-outbound.rsc"
:local schedulerFile "scheduler-update-telegram-outbound.rsc"
:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"

:do {
    /tool fetch url=($baseUrl . "/" . $updateFile) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Telegram outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerFile) dst-path=$schedulerFile mode=https
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
