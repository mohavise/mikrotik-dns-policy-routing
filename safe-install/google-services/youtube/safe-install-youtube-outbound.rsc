# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=youtube
# safe-install=youtube-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/google-services/youtube/routeros/update.rsc"
:local schedulerPath "categories/google-services/youtube/routeros/scheduler.rsc"
:local updateFile "update-youtube-outbound.rsc"
:local schedulerFile "scheduler-update-youtube-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "YouTube outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "YouTube outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-youtube-outbound
} on-error={
    :log error "YouTube outbound safe install: first update failed"
    :return
}

:log warning "YouTube outbound safe install: completed"

