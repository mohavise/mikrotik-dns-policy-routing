# Mobile App Store Safe Install

Install the whole mobile app store profile:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/mobile-app-store/safe-install-mobile-app-store-to-outbound.rsc" dst-path=safe-install-mobile-app-store-to-outbound.rsc mode=https
/import file-name=safe-install-mobile-app-store-to-outbound.rsc
/file remove [find name=safe-install-mobile-app-store-to-outbound.rsc]
```

Service installers are available in each service folder.
