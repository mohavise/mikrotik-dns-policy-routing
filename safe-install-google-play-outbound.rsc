# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-google-play-outbound.rsc
# safe-install=google-play-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/mobile-app-store/google-play/safe-install-google-play-outbound.rsc"
:local installerFile "compat-safe-install-google-play-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "Google Play outbound compatibility safe install: category installer failed"
    :return
}

:log warning "Google Play outbound compatibility safe install: completed"