# Discord for MikroTik

Install only the **Discord** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-DISCORD-TO-OUTBOUND` |
| Update script | `update-discord-outbound` |
| Daily scheduler | `update-discord-outbound` |
| Installer | `safe-install/messaging/discord/safe-install-discord-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/discord/safe-install-discord-outbound.rsc" dst-path=safe-install-discord-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-discord-outbound.rsc
/file remove [find name=safe-install-discord-outbound.rsc]
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
/ip dns static print where address-list=DST-DISCORD-TO-OUTBOUND
/ip firewall address-list print where list=DST-DISCORD-TO-OUTBOUND
/system script print where name=update-discord-outbound
/system scheduler print where name=update-discord-outbound
```

Run an update manually:

```routeros
/system script run update-discord-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-DISCORD-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Discord to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-discord-outbound]
/system script remove [find name=update-discord-outbound]
/ip dns static remove [find address-list=DST-DISCORD-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-DISCORD-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-DISCORD-TO-OUTBOUND`; use a separate custom address list.
