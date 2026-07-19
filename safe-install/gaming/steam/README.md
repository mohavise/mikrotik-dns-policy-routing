# Steam for MikroTik

Install only the **Steam** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-STEAM-TO-OUTBOUND` |
| Update script | `update-steam-outbound` |
| Daily scheduler | `update-steam-outbound` |
| Installer | `safe-install/gaming/steam/safe-install-steam-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/gaming/steam/safe-install-steam-outbound.rsc" dst-path=safe-install-steam-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-steam-outbound.rsc
/file remove [find name=safe-install-steam-outbound.rsc]
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
/ip dns static print where address-list=DST-STEAM-TO-OUTBOUND
/ip firewall address-list print where list=DST-STEAM-TO-OUTBOUND
/system script print where name=update-steam-outbound
/system scheduler print where name=update-steam-outbound
```

Run an update manually:

```routeros
/system script run update-steam-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-STEAM-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Steam to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-steam-outbound]
/system script remove [find name=update-steam-outbound]
/ip dns static remove [find address-list=DST-STEAM-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-STEAM-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-STEAM-TO-OUTBOUND`; use a separate custom address list.
