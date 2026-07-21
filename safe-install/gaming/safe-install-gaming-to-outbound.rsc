# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=gaming-to-outbound
# safe-install=gaming-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/gaming/gaming-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/gaming/gaming-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-gaming-outbound.rsc"
:local schedulerFile "scheduler-update-gaming-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Gaming outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Gaming outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-gaming-outbound
} on-error={
    :log error "Gaming outbound safe install: first update failed"
    :return ""
}

:log warning "Gaming outbound safe install: completed"

