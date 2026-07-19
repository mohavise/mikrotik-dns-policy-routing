# Windows Update for MikroTik

Install only the **Windows Update** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-WINDOWS-UPDATE-TO-OUTBOUND` |
| Update script | `update-windows-update-outbound` |
| Daily scheduler | `update-windows-update-outbound` |
| Installer | `safe-install/microsoft-services/windows-update/safe-install-windows-update-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/microsoft-services/windows-update/safe-install-windows-update-outbound.rsc" dst-path=safe-install-windows-update-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-windows-update-outbound.rsc
/file remove [find name=safe-install-windows-update-outbound.rsc]
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
/ip dns static print where address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND
/ip firewall address-list print where list=DST-WINDOWS-UPDATE-TO-OUTBOUND
/system script print where name=update-windows-update-outbound
/system scheduler print where name=update-windows-update-outbound
```

Run an update manually:

```routeros
/system script run update-windows-update-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Windows Update to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-windows-update-outbound]
/system script remove [find name=update-windows-update-outbound]
/ip dns static remove [find address-list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-WINDOWS-UPDATE-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-WINDOWS-UPDATE-TO-OUTBOUND`; use a separate custom address list.
