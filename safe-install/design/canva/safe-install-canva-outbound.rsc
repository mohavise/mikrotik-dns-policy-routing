# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=canva
# safe-install=canva-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/design/canva/routeros/update.rsc"
:local schedulerPath "categories/design/canva/routeros/scheduler.rsc"
:local updateFile "update-canva-outbound.rsc"
:local schedulerFile "scheduler-update-canva-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Canva outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Canva outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-canva-outbound
} on-error={
    :log error "Canva outbound safe install: first update failed"
    :return
}

:log warning "Canva outbound safe install: completed"

