# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=redhat
# safe-install=redhat-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/package-repositories/redhat/routeros/update.rsc"
:local schedulerPath "categories/package-repositories/redhat/routeros/scheduler.rsc"
:local updateFile "update-redhat-outbound.rsc"
:local schedulerFile "scheduler-update-redhat-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Red Hat outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Red Hat outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-redhat-outbound
} on-error={
    :log error "Red Hat outbound safe install: first update failed"
    :return
}

:log warning "Red Hat outbound safe install: completed"