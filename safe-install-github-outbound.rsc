# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=github
# safe-install=github-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "services/github/routeros/update.rsc"
:local schedulerPath "services/github/routeros/scheduler.rsc"
:local updateFile "update-github-outbound.rsc"
:local schedulerFile "scheduler-update-github-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "GitHub outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "GitHub outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-github-outbound
} on-error={
    :log error "GitHub outbound safe install: first update failed"
    :return
}

:log warning "GitHub outbound safe install: completed"

