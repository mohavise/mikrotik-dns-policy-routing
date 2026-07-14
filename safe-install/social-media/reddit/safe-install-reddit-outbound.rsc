# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=reddit
# safe-install=reddit-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/social-media/reddit/routeros/update.rsc"
:local schedulerPath "categories/social-media/reddit/routeros/scheduler.rsc"
:local updateFile "update-reddit-outbound.rsc"
:local schedulerFile "scheduler-update-reddit-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Reddit outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Reddit outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-reddit-outbound
} on-error={
    :log error "Reddit outbound safe install: first update failed"
    :return
}

:log warning "Reddit outbound safe install: completed"
