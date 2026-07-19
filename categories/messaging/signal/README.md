# Signal for MikroTik

Install only the **Signal** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-SIGNAL-TO-OUTBOUND` |
| Update script | `update-signal-outbound` |
| Daily scheduler | `update-signal-outbound` |
| Installer | `safe-install/messaging/signal/safe-install-signal-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/signal/safe-install-signal-outbound.rsc" dst-path=safe-install-signal-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-signal-outbound.rsc
/file remove [find name=safe-install-signal-outbound.rsc]
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
/ip dns static print where address-list=DST-SIGNAL-TO-OUTBOUND
/ip firewall address-list print where list=DST-SIGNAL-TO-OUTBOUND
/system script print where name=update-signal-outbound
/system scheduler print where name=update-signal-outbound
```

Run an update manually:

```routeros
/system script run update-signal-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-SIGNAL-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Signal to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-signal-outbound]
/system script remove [find name=update-signal-outbound]
/ip dns static remove [find address-list=DST-SIGNAL-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-SIGNAL-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-SIGNAL-TO-OUTBOUND`; use a separate custom address list.
