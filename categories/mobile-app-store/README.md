# Mobile App Store Category for MikroTik

Install the complete **Mobile App Store** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-MOBILE-APP-STORE-TO-OUTBOUND` |
| Update script | `update-mobile-app-store-to-outbound` |
| Daily scheduler | `update-mobile-app-store-to-outbound` |
| Installer | `safe-install/mobile-app-store/safe-install-mobile-app-store-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/mobile-app-store/safe-install-mobile-app-store-to-outbound.rsc" dst-path=safe-install-mobile-app-store-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-mobile-app-store-to-outbound.rsc
/file remove [find name=safe-install-mobile-app-store-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Apple App Store](./apple-app-store/) | `DST-APPLE-APP-STORE-TO-OUTBOUND` |
| [Google Play](./google-play/) | `DST-GOOGLE-PLAY-TO-OUTBOUND` |
| [Samsung Galaxy Store](./samsung-galaxy-store/) | `DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND` |

To install only one service, open that service folder and use its own README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND
/ip firewall address-list print where list=DST-MOBILE-APP-STORE-TO-OUTBOUND
/system script print where name=update-mobile-app-store-to-outbound
/system scheduler print where name=update-mobile-app-store-to-outbound
```

Run an update manually:

```routeros
/system script run update-mobile-app-store-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Mobile App Store to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-mobile-app-store-to-outbound]
/system script remove [find name=update-mobile-app-store-to-outbound]
/ip dns static remove [find address-list=DST-MOBILE-APP-STORE-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-MOBILE-APP-STORE-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
