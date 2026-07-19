# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=windows-update
# safe-install=windows-update-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/microsoft-services/windows-update/routeros/update.rsc"
:local schedulerPath "categories/microsoft-services/windows-update/routeros/scheduler.rsc"
:local updateFile "update-windows-update-outbound.rsc"
:local schedulerFile "scheduler-update-windows-update-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Windows Update outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Windows Update outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-windows-update-outbound
} on-error={
    :log error "Windows Update outbound safe install: first update failed"
    :return
}

:log warning "Windows Update outbound safe install: completed"