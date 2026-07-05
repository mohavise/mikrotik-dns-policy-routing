# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=cloud-storage-to-outbound
# safe-install=cloud-storage-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "profiles/cloud-storage-to-outbound/routeros/update.rsc"
:local schedulerPath "profiles/cloud-storage-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-cloud-storage-outbound.rsc"
:local schedulerFile "scheduler-update-cloud-storage-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Cloud Storage outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Cloud Storage outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-cloud-storage-outbound
} on-error={
    :log error "Cloud Storage outbound safe install: first update failed"
    :return
}

:log warning "Cloud Storage outbound safe install: completed"

