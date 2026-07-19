# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=financial-services-to-outbound
# safe-install=financial-services-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/financial-services/financial-services-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/financial-services/financial-services-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-financial-services-outbound.rsc"
:local schedulerFile "scheduler-update-financial-services-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Financial services outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Financial services outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-financial-services-outbound
} on-error={
    :log error "Financial services outbound safe install: first update failed"
    :return
}

:log warning "Financial services outbound safe install: completed"
