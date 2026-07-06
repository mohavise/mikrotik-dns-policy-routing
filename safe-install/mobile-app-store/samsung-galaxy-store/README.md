# Samsung Galaxy Store Safe Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/mobile-app-store/samsung-galaxy-store/safe-install-samsung-galaxy-store-outbound.rsc" dst-path=safe-install-samsung-galaxy-store-outbound.rsc mode=https
/import file-name=safe-install-samsung-galaxy-store-outbound.rsc
/file remove [find name=safe-install-samsung-galaxy-store-outbound.rsc]
```
