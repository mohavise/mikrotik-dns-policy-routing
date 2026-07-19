# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=onedrive
# safe-install=onedrive-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/microsoft-services/onedrive/routeros/update.rsc"
:local schedulerPath "categories/microsoft-services/onedrive/routeros/scheduler.rsc"
:local updateFile "update-onedrive-outbound.rsc"
:local schedulerFile "scheduler-update-onedrive-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "OneDrive outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "OneDrive outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-onedrive-outbound
} on-error={
    :log error "OneDrive outbound safe install: first update failed"
    :return
}

:log warning "OneDrive outbound safe install: completed"