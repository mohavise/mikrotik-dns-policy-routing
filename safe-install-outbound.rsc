# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=primary-to-outbound
# safe-install=outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "profiles/primary-to-outbound/routeros/update.rsc"
:local schedulerPath "profiles/primary-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-outbound.rsc"
:local schedulerFile "scheduler-update-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Primary outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Primary outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-outbound
} on-error={
    :log error "Primary outbound safe install: first update failed"
    :return
}

:log warning "Primary outbound safe install: completed"
