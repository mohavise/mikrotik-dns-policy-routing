# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=microsoft-azure
# safe-install=microsoft-azure-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/cloud-platforms/microsoft-azure/routeros/update.rsc"
:local schedulerPath "categories/cloud-platforms/microsoft-azure/routeros/scheduler.rsc"
:local updateFile "update-microsoft-azure-outbound.rsc"
:local schedulerFile "scheduler-update-microsoft-azure-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Microsoft Azure outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Microsoft Azure outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-microsoft-azure-outbound
} on-error={
    :log error "Microsoft Azure outbound safe install: first update failed"
    :return
}

:log warning "Microsoft Azure outbound safe install: completed"
