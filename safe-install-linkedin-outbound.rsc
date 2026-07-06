# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# compatibility-wrapper=safe-install-linkedin-outbound.rsc
# safe-install=linkedin-outbound

:local baseUrl "https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
:local installerPath "safe-install/social-media/linkedin/safe-install-linkedin-outbound.rsc"
:local installerFile "compat-safe-install-linkedin-outbound.rsc"

:if ([:len [/file find name=$installerFile]] > 0) do={ /file remove $installerFile }

:do {
    /tool fetch url=($baseUrl . "/" . $installerPath) dst-path=$installerFile mode=https
    /import file-name=$installerFile
    /file remove $installerFile
} on-error={
    :log error "LinkedIn outbound compatibility safe install: category installer failed"
    :return
}

:log warning "LinkedIn outbound compatibility safe install: completed"