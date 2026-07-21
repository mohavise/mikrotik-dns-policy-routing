# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# safe-install=discord-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/messaging/discord/routeros/update.rsc"
:local schedulerPath "categories/messaging/discord/routeros/scheduler.rsc"
:local updateFile "update-discord-outbound.rsc"
:local schedulerFile "scheduler-update-discord-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Discord outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Discord outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-discord-outbound
} on-error={
    :log error "Discord outbound safe install: first update failed"
    :return ""
}

:log warning "Discord outbound safe install: completed"
