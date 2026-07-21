# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=debian
# safe-install=debian-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/package-repositories/debian/routeros/update.rsc"
:local schedulerPath "categories/package-repositories/debian/routeros/scheduler.rsc"
:local updateFile "update-debian-outbound.rsc"
:local schedulerFile "scheduler-update-debian-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Debian outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Debian outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-debian-outbound
} on-error={
    :log error "Debian outbound safe install: first update failed"
    :return ""
}

:log warning "Debian outbound safe install: completed"