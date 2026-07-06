# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=video-streaming-to-outbound
# safe-install=video-streaming-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/video-streaming/video-streaming-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/video-streaming/video-streaming-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-video-streaming-outbound.rsc"
:local schedulerFile "scheduler-update-video-streaming-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Video Streaming outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Video Streaming outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-video-streaming-outbound
} on-error={
    :log error "Video Streaming outbound safe install: first update failed"
    :return
}

:log warning "Video Streaming outbound safe install: completed"

