# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=microsoft-services-to-outbound
# safe-install=microsoft-services-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/microsoft-services/microsoft-services-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/microsoft-services/microsoft-services-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-microsoft-services-outbound.rsc"
:local schedulerFile "scheduler-update-microsoft-services-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Microsoft Services outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Microsoft Services outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-microsoft-services-outbound
} on-error={
    :log error "Microsoft Services outbound safe install: first update failed"
    :return
}

:log warning "Microsoft Services outbound safe install: completed"