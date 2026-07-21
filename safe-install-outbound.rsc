# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=primary-to-outbound
# safe-install=outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local updatePath "categories/primary/primary-to-outbound/routeros/update.rsc"
:local schedulerPath "categories/primary/primary-to-outbound/routeros/scheduler.rsc"
:local updateFile "update-outbound.rsc"
:local schedulerFile "scheduler-update-outbound.rsc"

:if ([:len [/file find name=$updateFile]] > 0) do={ /file remove [find name=$updateFile] }
:if ([:len [/file find name=$schedulerFile]] > 0) do={ /file remove [find name=$schedulerFile] }

:do {
    /tool fetch url=($baseUrl . "/" . $updatePath) dst-path=$updateFile check-certificate=yes-without-crl
    :if ([:len [/file find name=$updateFile]] = 0) do={ :error "updater file missing" }
    /import file-name=$updateFile verbose=yes dry-run
    /import file-name=$updateFile verbose=yes
    /file remove [find name=$updateFile]
} on-error={
    :if ([:len [/file find name=$updateFile]] > 0) do={ /file remove [find name=$updateFile] }
    :log error "Primary outbound safe install: updater install failed"
    :return ""
}

:do {
    /tool fetch url=($baseUrl . "/" . $schedulerPath) dst-path=$schedulerFile check-certificate=yes-without-crl
    :if ([:len [/file find name=$schedulerFile]] = 0) do={ :error "scheduler file missing" }
    /import file-name=$schedulerFile verbose=yes dry-run
    /import file-name=$schedulerFile verbose=yes
    /file remove [find name=$schedulerFile]
} on-error={
    :if ([:len [/file find name=$schedulerFile]] > 0) do={ /file remove [find name=$schedulerFile] }
    :log error "Primary outbound safe install: scheduler install failed"
    :return ""
}

:do {
    /system script run update-outbound
} on-error={
    :log error "Primary outbound safe install: first update failed"
    :return ""
}

:log warning "Primary outbound safe install: completed"
