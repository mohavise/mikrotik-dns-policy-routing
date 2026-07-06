# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-signal-outbound.rsc
# safe-install=signal-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/messaging/signal/safe-install-signal-outbound.rsc"
:local installerFile "compat-safe-install-signal-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "Signal outbound compatibility safe install: category installer failed"
    :return
}

:log warning "Signal outbound compatibility safe install: completed"