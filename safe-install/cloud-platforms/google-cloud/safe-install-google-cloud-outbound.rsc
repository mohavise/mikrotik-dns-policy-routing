# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-cloud
# safe-install=google-cloud-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/cloud-platforms/google-cloud/routeros/update.rsc"
:local schedulerPath "categories/cloud-platforms/google-cloud/routeros/scheduler.rsc"
:local updateFile "update-google-cloud-outbound.rsc"
:local schedulerFile "scheduler-update-google-cloud-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Google Cloud outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Google Cloud outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-google-cloud-outbound
} on-error={
    :log error "Google Cloud outbound safe install: first update failed"
    :return
}

:log warning "Google Cloud outbound safe install: completed"
