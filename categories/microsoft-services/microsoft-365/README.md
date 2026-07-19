# Microsoft 365 for MikroTik

Install only the **Microsoft 365** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-MICROSOFT-365-TO-OUTBOUND` |
| Update script | `update-microsoft-365-outbound` |
| Daily scheduler | `update-microsoft-365-outbound` |
| Installer | `safe-install/microsoft-services/microsoft-365/safe-install-microsoft-365-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/microsoft-services/microsoft-365/safe-install-microsoft-365-outbound.rsc" dst-path=safe-install-microsoft-365-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-microsoft-365-outbound.rsc
/file remove [find name=safe-install-microsoft-365-outbound.rsc]
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
/ip dns static print where address-list=DST-MICROSOFT-365-TO-OUTBOUND
/ip firewall address-list print where list=DST-MICROSOFT-365-TO-OUTBOUND
/system script print where name=update-microsoft-365-outbound
/system scheduler print where name=update-microsoft-365-outbound
```

Run an update manually:

```routeros
/system script run update-microsoft-365-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-MICROSOFT-365-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Microsoft 365 to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-microsoft-365-outbound]
/system script remove [find name=update-microsoft-365-outbound]
/ip dns static remove [find address-list=DST-MICROSOFT-365-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-MICROSOFT-365-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-MICROSOFT-365-TO-OUTBOUND`; use a separate custom address list.
