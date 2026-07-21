# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=package-repositories-to-outbound
# safe-install=package-repositories-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/package-repositories/package-repositories-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/package-repositories/package-repositories-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-package-repositories-outbound.rsc"
:local schedulerFile "scheduler-update-package-repositories-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Package repositories outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Package repositories outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-package-repositories-outbound
} on-error={
    :log error "Package repositories outbound safe install: first update failed"
    :return ""
}

:log warning "Package repositories outbound safe install: completed"