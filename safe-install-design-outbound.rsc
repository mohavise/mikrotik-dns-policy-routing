# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=design-to-outbound
# safe-install=design-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "profiles/design-to-outbound/routeros/update.rsc"
:local schedulerPath "profiles/design-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-design-outbound.rsc"
:local schedulerFile "scheduler-update-design-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Design outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Design outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-design-outbound
} on-error={
    :log error "Design outbound safe install: first update failed"
    :return
}

:log warning "Design outbound safe install: completed"

