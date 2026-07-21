# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=music-to-outbound
# safe-install=music-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/music/music-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/music/music-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-music-outbound.rsc"
:local schedulerFile "scheduler-update-music-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Music outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Music outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-music-outbound
} on-error={
    :log error "Music outbound safe install: first update failed"
    :return ""
}

:log warning "Music outbound safe install: completed"

