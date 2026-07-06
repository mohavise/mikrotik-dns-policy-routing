# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-instagram-outbound.rsc
# safe-install=instagram-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/social-media/instagram/safe-install-instagram-outbound.rsc"
:local installerFile "compat-safe-install-instagram-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "Instagram outbound compatibility safe install: category installer failed"
    :return
}

:log warning "Instagram outbound compatibility safe install: completed"