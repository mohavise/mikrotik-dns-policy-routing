# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ubuntu
# safe-install=ubuntu-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/package-repositories/ubuntu/routeros/update.rsc"
:local schedulerPath "categories/package-repositories/ubuntu/routeros/scheduler.rsc"
:local updateFile "update-ubuntu-outbound.rsc"
:local schedulerFile "scheduler-update-ubuntu-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Ubuntu outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Ubuntu outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-ubuntu-outbound
} on-error={
    :log error "Ubuntu outbound safe install: first update failed"
    :return ""
}

:log warning "Ubuntu outbound safe install: completed"