# Microsoft Teams for MikroTik

Install only the **Microsoft Teams** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-TEAMS-TO-OUTBOUND` |
| Update script | `update-teams-outbound` |
| Daily scheduler | `update-teams-outbound` |
| Installer | `safe-install/microsoft-services/teams/safe-install-teams-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/microsoft-services/teams/safe-install-teams-outbound.rsc" dst-path=safe-install-teams-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-teams-outbound.rsc
/file remove [find name=safe-install-teams-outbound.rsc]
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
/ip dns static print where address-list=DST-TEAMS-TO-OUTBOUND
/ip firewall address-list print where list=DST-TEAMS-TO-OUTBOUND
/system script print where name=update-teams-outbound
/system scheduler print where name=update-teams-outbound
```

Run an update manually:

```routeros
/system script run update-teams-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-TEAMS-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Microsoft Teams to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-teams-outbound]
/system script remove [find name=update-teams-outbound]
/ip dns static remove [find address-list=DST-TEAMS-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-TEAMS-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-TEAMS-TO-OUTBOUND`; use a separate custom address list.
