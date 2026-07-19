# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=whatsapp
# safe-install=whatsapp-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/messaging/whatsapp/routeros/update.rsc"
:local schedulerPath "categories/messaging/whatsapp/routeros/scheduler.rsc"
:local updateFile "update-whatsapp-outbound.rsc"
:local schedulerFile "scheduler-update-whatsapp-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "WhatsApp outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "WhatsApp outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-whatsapp-outbound
} on-error={
    :log error "WhatsApp outbound safe install: first update failed"
    :return
}

:log warning "WhatsApp outbound safe install: completed"
