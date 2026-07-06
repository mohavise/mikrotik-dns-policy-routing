# Google Play Safe Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/mobile-app-store/google-play/safe-install-google-play-outbound.rsc" dst-path=safe-install-google-play-outbound.rsc mode=https
/import file-name=safe-install-google-play-outbound.rsc
/file remove [find name=safe-install-google-play-outbound.rsc]
```
