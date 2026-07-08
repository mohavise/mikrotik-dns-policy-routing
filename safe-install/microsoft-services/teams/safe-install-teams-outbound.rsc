# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=teams
# safe-install=teams-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/microsoft-services/teams/routeros/update.rsc"
:local schedulerPath "categories/microsoft-services/teams/routeros/scheduler.rsc"
:local updateFile "update-teams-outbound.rsc"
:local schedulerFile "scheduler-update-teams-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Microsoft Teams outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Microsoft Teams outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-teams-outbound
} on-error={
    :log error "Microsoft Teams outbound safe install: first update failed"
    :return
}

:log warning "Microsoft Teams outbound safe install: completed"