# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=linkedin
# safe-install=linkedin-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/social-media/linkedin/routeros/update.rsc"
:local schedulerPath "categories/social-media/linkedin/routeros/scheduler.rsc"
:local updateFile "update-linkedin-outbound.rsc"
:local schedulerFile "scheduler-update-linkedin-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "LinkedIn outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "LinkedIn outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-linkedin-outbound
} on-error={
    :log error "LinkedIn outbound safe install: first update failed"
    :return
}

:log warning "LinkedIn outbound safe install: completed"
