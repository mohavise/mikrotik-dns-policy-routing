# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-steam-outbound.rsc
# safe-install=steam-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/gaming/steam/safe-install-steam-outbound.rsc"
:local installerFile "compat-safe-install-steam-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "Steam outbound compatibility safe install: category installer failed"
    :return
}

:log warning "Steam outbound compatibility safe install: completed"