# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=social-media-to-outbound
# safe-install=social-media-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/social-media/social-media-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/social-media/social-media-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-social-media-outbound.rsc"
:local schedulerFile "scheduler-update-social-media-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Social media outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Social media outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-social-media-outbound
} on-error={
    :log error "Social media outbound safe install: first update failed"
    :return ""
}

:log warning "Social media outbound safe install: completed"
