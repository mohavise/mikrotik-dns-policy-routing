# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-messaging-outbound.rsc
# safe-install=messaging-to-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/messaging/safe-install-messaging-to-outbound.rsc"
:local installerFile "compat-safe-install-messaging-to-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "Messaging outbound compatibility safe install: category installer failed"
    :return
}

:log warning "Messaging outbound compatibility safe install: completed"