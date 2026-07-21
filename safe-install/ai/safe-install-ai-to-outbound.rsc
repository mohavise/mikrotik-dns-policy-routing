# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=ai-to-outbound
# safe-install=ai-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/ai/ai-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/ai/ai-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-ai-outbound.rsc"
:local schedulerFile "scheduler-update-ai-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "AI outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "AI outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-ai-outbound
} on-error={
    :log error "AI outbound safe install: first update failed"
    :return ""
}

:log warning "AI outbound safe install: completed"

