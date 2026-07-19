# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=google-drive
# safe-install=google-drive-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/google-services/google-drive/routeros/update.rsc"
:local schedulerPath "categories/google-services/google-drive/routeros/scheduler.rsc"
:local updateFile "update-google-drive-outbound.rsc"
:local schedulerFile "scheduler-update-google-drive-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Google Drive outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Google Drive outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-google-drive-outbound
} on-error={
    :log error "Google Drive outbound safe install: first update failed"
    :return
}

:log warning "Google Drive outbound safe install: completed"

