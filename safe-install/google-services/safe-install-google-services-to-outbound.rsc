# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=google-services-to-outbound
# safe-install=google-services-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/google-services/google-services-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/google-services/google-services-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-google-services-outbound.rsc"
:local schedulerFile "scheduler-update-google-services-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Google Services outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Google Services outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-google-services-outbound
} on-error={
    :log error "Google Services outbound safe install: first update failed"
    :return
}

:log warning "Google Services outbound safe install: completed"

