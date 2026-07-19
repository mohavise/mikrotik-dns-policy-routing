# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=samsung-galaxy-store
# safe-install=samsung-galaxy-store-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/mobile-app-store/samsung-galaxy-store/routeros/update.rsc"
:local schedulerPath "categories/mobile-app-store/samsung-galaxy-store/routeros/scheduler.rsc"
:local updateFile "update-samsung-galaxy-store-outbound.rsc"
:local schedulerFile "scheduler-update-samsung-galaxy-store-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Samsung Galaxy Store outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Samsung Galaxy Store outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-samsung-galaxy-store-outbound
} on-error={
    :log error "Samsung Galaxy Store outbound safe install: first update failed"
    :return
}

:log warning "Samsung Galaxy Store outbound safe install: completed"
