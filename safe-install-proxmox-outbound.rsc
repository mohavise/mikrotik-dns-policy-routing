# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=proxmox
# safe-install=proxmox-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "services/proxmox/routeros/update.rsc"
:local schedulerPath "services/proxmox/routeros/scheduler.rsc"
:local updateFile "update-proxmox-outbound.rsc"
:local schedulerFile "scheduler-update-proxmox-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "Proxmox outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "Proxmox outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-proxmox-outbound
} on-error={
    :log error "Proxmox outbound safe install: first update failed"
    :return
}

:log warning "Proxmox outbound safe install: completed"