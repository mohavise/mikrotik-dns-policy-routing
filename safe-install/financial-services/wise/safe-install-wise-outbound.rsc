# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=wise
# safe-install=wise-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/financial-services/wise/routeros/update.rsc"
:local schedulerPath "categories/financial-services/wise/routeros/scheduler.rsc"
:local updateFile "update-wise-outbound.rsc"
:local schedulerFile "scheduler-update-wise-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Wise outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Wise outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-wise-outbound
} on-error={
    :log error "Wise outbound safe install: first update failed"
    :return ""
}

:log warning "Wise outbound safe install: completed"
