# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=ip-detection
# safe-install=ip-detection-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/network-tools/ip-detection/routeros/update.rsc"
:local schedulerPath "categories/network-tools/ip-detection/routeros/scheduler.rsc"
:local updateFile "update-ip-detection-outbound.rsc"
:local schedulerFile "scheduler-update-ip-detection-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove [find name=$updateFile]
} on-error={
    :log error "IP Detection safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove [find name=$schedulerFile]
} on-error={
    :log error "IP Detection safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-ip-detection-outbound
} on-error={
    :log error "IP Detection safe install: first update failed"
    :return ""
}

:log warning "IP Detection safe install: completed"
