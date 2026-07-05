# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=docker
# safe-install=docker-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "services/docker/routeros/update.rsc"
:local schedulerPath "services/docker/routeros/scheduler.rsc"
:local updateFile "update-docker-outbound.rsc"
:local schedulerFile "scheduler-update-docker-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Docker outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Docker outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-docker-outbound
} on-error={
    :log error "Docker outbound safe install: first update failed"
    :return
}

:log warning "Docker outbound safe install: completed"