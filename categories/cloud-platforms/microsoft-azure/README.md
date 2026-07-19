# Microsoft Azure for MikroTik

Install only the **Microsoft Azure** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-MICROSOFT-AZURE-TO-OUTBOUND` |
| Update script | `update-microsoft-azure-outbound` |
| Daily scheduler | `update-microsoft-azure-outbound` |
| Installer | `safe-install/cloud-platforms/microsoft-azure/safe-install-microsoft-azure-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/cloud-platforms/microsoft-azure/safe-install-microsoft-azure-outbound.rsc" dst-path=safe-install-microsoft-azure-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-microsoft-azure-outbound.rsc
/file remove [find name=safe-install-microsoft-azure-outbound.rsc]
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
/ip dns static print where address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND
/ip firewall address-list print where list=DST-MICROSOFT-AZURE-TO-OUTBOUND
/system script print where name=update-microsoft-azure-outbound
/system scheduler print where name=update-microsoft-azure-outbound
```

Run an update manually:

```routeros
/system script run update-microsoft-azure-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Microsoft Azure to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-microsoft-azure-outbound]
/system script remove [find name=update-microsoft-azure-outbound]
/ip dns static remove [find address-list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-MICROSOFT-AZURE-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-MICROSOFT-AZURE-TO-OUTBOUND`; use a separate custom address list.
