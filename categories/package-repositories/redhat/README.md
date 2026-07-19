# Red Hat for MikroTik

Install only the **Red Hat** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-REDHAT-TO-OUTBOUND` |
| Update script | `update-redhat-outbound` |
| Daily scheduler | `update-redhat-outbound` |
| Installer | `safe-install/package-repositories/redhat/safe-install-redhat-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/package-repositories/redhat/safe-install-redhat-outbound.rsc" dst-path=safe-install-redhat-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-redhat-outbound.rsc
/file remove [find name=safe-install-redhat-outbound.rsc]
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
/ip dns static print where address-list=DST-REDHAT-TO-OUTBOUND
/ip firewall address-list print where list=DST-REDHAT-TO-OUTBOUND
/system script print where name=update-redhat-outbound
/system scheduler print where name=update-redhat-outbound
```

Run an update manually:

```routeros
/system script run update-redhat-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-REDHAT-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Red Hat to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-redhat-outbound]
/system script remove [find name=update-redhat-outbound]
/ip dns static remove [find address-list=DST-REDHAT-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-REDHAT-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-REDHAT-TO-OUTBOUND`; use a separate custom address list.
