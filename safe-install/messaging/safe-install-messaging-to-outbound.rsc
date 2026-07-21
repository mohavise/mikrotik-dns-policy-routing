# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=messaging-to-outbound
# safe-install=messaging-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/messaging/messaging-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/messaging/messaging-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-messaging-outbound.rsc"
:local schedulerFile "scheduler-update-messaging-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Messaging outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Messaging outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-messaging-outbound
} on-error={
    :log error "Messaging outbound safe install: first update failed"
    :return ""
}

:log warning "Messaging outbound safe install: completed"
