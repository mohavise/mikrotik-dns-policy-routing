# Apple App Store for MikroTik

Install only the **Apple App Store** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-APPLE-APP-STORE-TO-OUTBOUND` |
| Update script | `update-apple-app-store-outbound` |
| Daily scheduler | `update-apple-app-store-outbound` |
| Installer | `safe-install/mobile-app-store/apple-app-store/safe-install-apple-app-store-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/mobile-app-store/apple-app-store/safe-install-apple-app-store-outbound.rsc" dst-path=safe-install-apple-app-store-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-apple-app-store-outbound.rsc
/file remove [find name=safe-install-apple-app-store-outbound.rsc]
```

The installer downloads the managed updater and scheduler, installs them without duplicates, and runs the first update.

## Requirements

Clients must use the MikroTik router for DNS so DNS Static FWD rules can learn destination IP addresses:

```routeros
/ip dns set allow-remote-requests=yes
```

Prevent client DNS bypass separately when required by your network design.

## Verify

```routeros
/ip dns static print where address-list=DST-APPLE-APP-STORE-TO-OUTBOUND
/ip firewall address-list print where list=DST-APPLE-APP-STORE-TO-OUTBOUND
/system script print where name=update-apple-app-store-outbound
/system scheduler print where name=update-apple-app-store-outbound
```

Run an update manually:

```routeros
/system script run update-apple-app-store-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-APPLE-APP-STORE-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Apple App Store to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-apple-app-store-outbound]
/system script remove [find name=update-apple-app-store-outbound]
/ip dns static remove [find address-list=DST-APPLE-APP-STORE-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-APPLE-APP-STORE-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-APPLE-APP-STORE-TO-OUTBOUND`; use a separate custom address list.
