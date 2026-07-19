# Wise for MikroTik

Install only the **Wise** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-WISE-TO-OUTBOUND` |
| Update script | `update-wise-outbound` |
| Daily scheduler | `update-wise-outbound` |
| Installer | `safe-install/financial-services/wise/safe-install-wise-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/financial-services/wise/safe-install-wise-outbound.rsc" dst-path=safe-install-wise-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-wise-outbound.rsc
/file remove [find name=safe-install-wise-outbound.rsc]
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
/ip dns static print where address-list=DST-WISE-TO-OUTBOUND
/ip firewall address-list print where list=DST-WISE-TO-OUTBOUND
/system script print where name=update-wise-outbound
/system scheduler print where name=update-wise-outbound
```

Run an update manually:

```routeros
/system script run update-wise-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-WISE-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Wise to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-wise-outbound]
/system script remove [find name=update-wise-outbound]
/ip dns static remove [find address-list=DST-WISE-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-WISE-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-WISE-TO-OUTBOUND`; use a separate custom address list.
