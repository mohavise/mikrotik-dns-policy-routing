# Apple App Store Sources

## Official Sources

- Apple Support: [Use Apple products on enterprise networks](https://support.apple.com/en-us/101555)
- Apple Support: [TCP and UDP ports used by Apple software products](https://support.apple.com/en-us/103229)

## Scope

This service uses the Apple Support "Apps and additional content" host list for installing and updating apps, store content, app validation, app notarization, alternative marketplaces, and app-related downloadable content.

Wildcard hosts from Apple documentation are normalized to base domains in `domains.txt`; MikroTik output converts them to RouterOS-compatible regex rules.
