# Figma for MikroTik

Install only the **Figma** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-FIGMA-TO-OUTBOUND` |
| Update script | `update-figma-outbound` |
| Daily scheduler | `update-figma-outbound` |
| Installer | `safe-install/design/figma/safe-install-figma-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/design/figma/safe-install-figma-outbound.rsc" dst-path=safe-install-figma-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-figma-outbound.rsc
/file remove [find name=safe-install-figma-outbound.rsc]
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
/ip dns static print where address-list=DST-FIGMA-TO-OUTBOUND
/ip firewall address-list print where list=DST-FIGMA-TO-OUTBOUND
/system script print where name=update-figma-outbound
/system scheduler print where name=update-figma-outbound
```

Run an update manually:

```routeros
/system script run update-figma-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-FIGMA-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Figma to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-figma-outbound]
/system script remove [find name=update-figma-outbound]
/ip dns static remove [find address-list=DST-FIGMA-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-FIGMA-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-FIGMA-TO-OUTBOUND`; use a separate custom address list.
