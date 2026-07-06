# Apple App Store Safe Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/mobile-app-store/apple-app-store/safe-install-apple-app-store-outbound.rsc" dst-path=safe-install-apple-app-store-outbound.rsc mode=https
/import file-name=safe-install-apple-app-store-outbound.rsc
/file remove [find name=safe-install-apple-app-store-outbound.rsc]
```
