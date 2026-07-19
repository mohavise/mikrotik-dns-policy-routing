# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=spotify
# safe-install=spotify-outbound

:local baseUrl "https://raw.spotifyusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/music/spotify/routeros/update.rsc"
:local schedulerPath "categories/music/spotify/routeros/scheduler.rsc"
:local updateFile "update-spotify-outbound.rsc"
:local schedulerFile "scheduler-update-spotify-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "spotify outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "spotify outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-spotify-outbound
} on-error={
    :log error "spotify outbound safe install: first update failed"
    :return
}

:log warning "spotify outbound safe install: completed"

