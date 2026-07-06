# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-apple-app-store-outbound.rsc
# safe-install=apple-app-store-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/mobile-app-store/apple-app-store/safe-install-apple-app-store-outbound.rsc"
:local installerFile "compat-safe-install-apple-app-store-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "Apple App Store outbound compatibility safe install: category installer failed"
    :return
}

:log warning "Apple App Store outbound compatibility safe install: completed"