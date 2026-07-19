# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=developer-to-outbound
# safe-install=developer-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/developer/developer-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/developer/developer-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-developer-outbound.rsc"
:local schedulerFile "scheduler-update-developer-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Developer outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Developer outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-developer-outbound
} on-error={
    :log error "Developer outbound safe install: first update failed"
    :return
}

:log warning "Developer outbound safe install: completed"

