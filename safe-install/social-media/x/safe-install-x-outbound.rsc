# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=x
# safe-install=x-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/social-media/x/routeros/update.rsc"
:local schedulerPath "categories/social-media/x/routeros/scheduler.rsc"
:local updateFile "update-x-outbound.rsc"
:local schedulerFile "scheduler-update-x-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "X outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "X outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-x-outbound
} on-error={
    :log error "X outbound safe install: first update failed"
    :return
}

:log warning "X outbound safe install: completed"
