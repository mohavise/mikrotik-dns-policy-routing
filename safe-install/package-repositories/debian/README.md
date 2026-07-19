# Debian for MikroTik

Install only the **Debian** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-DEBIAN-TO-OUTBOUND` |
| Update script | `update-debian-outbound` |
| Daily scheduler | `update-debian-outbound` |
| Installer | `safe-install/package-repositories/debian/safe-install-debian-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/package-repositories/debian/safe-install-debian-outbound.rsc" dst-path=safe-install-debian-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-debian-outbound.rsc
/file remove [find name=safe-install-debian-outbound.rsc]
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
/ip dns static print where address-list=DST-DEBIAN-TO-OUTBOUND
/ip firewall address-list print where list=DST-DEBIAN-TO-OUTBOUND
/system script print where name=update-debian-outbound
/system scheduler print where name=update-debian-outbound
```

Run an update manually:

```routeros
/system script run update-debian-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-DEBIAN-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Debian to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-debian-outbound]
/system script remove [find name=update-debian-outbound]
/ip dns static remove [find address-list=DST-DEBIAN-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-DEBIAN-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-DEBIAN-TO-OUTBOUND`; use a separate custom address list.
