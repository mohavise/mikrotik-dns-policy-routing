# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=figma
# safe-install=figma-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/design/figma/routeros/update.rsc"
:local schedulerPath "categories/design/figma/routeros/scheduler.rsc"
:local updateFile "update-figma-outbound.rsc"
:local schedulerFile "scheduler-update-figma-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Figma outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Figma outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-figma-outbound
} on-error={
    :log error "Figma outbound safe install: first update failed"
    :return ""
}

:log warning "Figma outbound safe install: completed"

