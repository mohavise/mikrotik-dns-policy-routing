# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=steam
# safe-install=steam-outbound

:local baseUrl "https://raw.steamusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/gaming/steam/routeros/update.rsc"
:local schedulerPath "categories/gaming/steam/routeros/scheduler.rsc"
:local updateFile "update-steam-outbound.rsc"
:local schedulerFile "scheduler-update-steam-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "steam outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "steam outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-steam-outbound
} on-error={
    :log error "steam outbound safe install: first update failed"
    :return
}

:log warning "steam outbound safe install: completed"

