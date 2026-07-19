# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=mobile-app-store-to-outbound
# safe-install=mobile-app-store-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/mobile-app-store/mobile-app-store-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/mobile-app-store/mobile-app-store-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-mobile-app-store-outbound.rsc"
:local schedulerFile "scheduler-update-mobile-app-store-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Mobile app store outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Mobile app store outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-mobile-app-store-outbound
} on-error={
    :log error "Mobile app store outbound safe install: first update failed"
    :return
}

:log warning "Mobile app store outbound safe install: completed"
