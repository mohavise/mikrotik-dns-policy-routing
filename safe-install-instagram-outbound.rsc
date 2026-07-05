# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=instagram
# safe-install=instagram-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "services/instagram/routeros/update.rsc"
:local schedulerPath "services/instagram/routeros/scheduler.rsc"
:local updateFile "update-instagram-outbound.rsc"
:local schedulerFile "scheduler-update-instagram-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Instagram outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Instagram outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-instagram-outbound
} on-error={
    :log error "Instagram outbound safe install: first update failed"
    :return
}

:log warning "Instagram outbound safe install: completed"
