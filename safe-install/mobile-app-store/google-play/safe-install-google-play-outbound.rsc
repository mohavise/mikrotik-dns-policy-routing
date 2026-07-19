# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-play
# safe-install=google-play-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/mobile-app-store/google-play/routeros/update.rsc"
:local schedulerPath "categories/mobile-app-store/google-play/routeros/scheduler.rsc"
:local updateFile "update-google-play-outbound.rsc"
:local schedulerFile "scheduler-update-google-play-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Google Play outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Google Play outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-google-play-outbound
} on-error={
    :log error "Google Play outbound safe install: first update failed"
    :return
}

:log warning "Google Play outbound safe install: completed"
