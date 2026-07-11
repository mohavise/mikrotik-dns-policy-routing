# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=speedtest
# safe-install=speedtest-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/network-tools/speedtest/routeros/update.rsc"
:local schedulerPath "categories/network-tools/speedtest/routeros/scheduler.rsc"
:local updateFile "update-speedtest-outbound.rsc"
:local schedulerFile "scheduler-update-speedtest-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove [find name=$updateFile]
} on-error={
    :log error "Speedtest safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove [find name=$schedulerFile]
} on-error={
    :log error "Speedtest safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-speedtest-outbound
} on-error={
    :log error "Speedtest safe install: first update failed"
    :return
}

:log warning "Speedtest safe install: completed"
