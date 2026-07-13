# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=aws
# safe-install=aws-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/cloud-platforms/aws/routeros/update.rsc"
:local schedulerPath "categories/cloud-platforms/aws/routeros/scheduler.rsc"
:local updateFile "update-aws-outbound.rsc"
:local schedulerFile "scheduler-update-aws-outbound.rsc"

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile mode=https
    /import file-name=$updateFile
    /file remove $updateFile
} on-error={
    :log error "AWS outbound safe install: updater install failed"
    :return
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile mode=https
    /import file-name=$schedulerFile
    /file remove $schedulerFile
} on-error={
    :log error "AWS outbound safe install: scheduler install failed"
    :return
}

:do {
    /system script run update-aws-outbound
} on-error={
    :log error "AWS outbound safe install: first update failed"
    :return
}

:log warning "AWS outbound safe install: completed"
