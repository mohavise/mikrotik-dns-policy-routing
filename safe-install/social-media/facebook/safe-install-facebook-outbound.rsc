# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=facebook
# safe-install=facebook-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/social-media/facebook/routeros/update.rsc"
:local schedulerPath "categories/social-media/facebook/routeros/scheduler.rsc"
:local updateFile "update-facebook-outbound.rsc"
:local schedulerFile "scheduler-update-facebook-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Facebook outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Facebook outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-facebook-outbound
} on-error={
    :log error "Facebook outbound safe install: first update failed"
    :return
}

:log warning "Facebook outbound safe install: completed"
