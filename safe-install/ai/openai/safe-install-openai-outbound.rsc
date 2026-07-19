# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=openai
# safe-install=openai-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/ai/openai/routeros/update.rsc"
:local schedulerPath "categories/ai/openai/routeros/scheduler.rsc"
:local updateFile "update-openai-outbound.rsc"
:local schedulerFile "scheduler-update-openai-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "OpenAI outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "OpenAI outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-openai-outbound
} on-error={
    :log error "OpenAI outbound safe install: first update failed"
    :return
}

:log warning "OpenAI outbound safe install: completed"

