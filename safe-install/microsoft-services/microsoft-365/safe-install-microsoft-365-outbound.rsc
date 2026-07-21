# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-365
# safe-install=microsoft-365-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/microsoft-services/microsoft-365/routeros/update.rsc"
:local schedulerPath "categories/microsoft-services/microsoft-365/routeros/scheduler.rsc"
:local updateFile "update-microsoft-365-outbound.rsc"
:local schedulerFile "scheduler-update-microsoft-365-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Microsoft 365 outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Microsoft 365 outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-microsoft-365-outbound
} on-error={
    :log error "Microsoft 365 outbound safe install: first update failed"
    :return ""
}

:log warning "Microsoft 365 outbound safe install: completed"