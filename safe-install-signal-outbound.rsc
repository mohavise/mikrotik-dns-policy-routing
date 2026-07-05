# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=signal
# safe-install=signal-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "services/signal/routeros/update.rsc"
:local schedulerPath "services/signal/routeros/scheduler.rsc"
:local updateFile "update-signal-outbound.rsc"
:local schedulerFile "scheduler-update-signal-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Signal outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Signal outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-signal-outbound
} on-error={
    :log error "Signal outbound safe install: first update failed"
    :return
}

:log warning "Signal outbound safe install: completed"
