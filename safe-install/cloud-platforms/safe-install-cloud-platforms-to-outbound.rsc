# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-platforms-to-outbound
# safe-install=cloud-platforms-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/cloud-platforms/cloud-platforms-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/cloud-platforms/cloud-platforms-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-cloud-platforms-outbound.rsc"
:local schedulerFile "scheduler-update-cloud-platforms-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Cloud platforms outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Cloud platforms outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-cloud-platforms-outbound
} on-error={
    :log error "Cloud platforms outbound safe install: first update failed"
    :return ""
}

:log warning "Cloud platforms outbound safe install: completed"
