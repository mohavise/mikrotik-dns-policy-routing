# Reddit for MikroTik

Install only the **Reddit** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-REDDIT-TO-OUTBOUND` |
| Update script | `update-reddit-outbound` |
| Daily scheduler | `update-reddit-outbound` |
| Installer | `safe-install/social-media/reddit/safe-install-reddit-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/social-media/reddit/safe-install-reddit-outbound.rsc" dst-path=safe-install-reddit-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-reddit-outbound.rsc
/file remove [find name=safe-install-reddit-outbound.rsc]
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
/ip dns static print where address-list=DST-REDDIT-TO-OUTBOUND
/ip firewall address-list print where list=DST-REDDIT-TO-OUTBOUND
/system script print where name=update-reddit-outbound
/system scheduler print where name=update-reddit-outbound
```

Run an update manually:

```routeros
/system script run update-reddit-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-REDDIT-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Reddit to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-reddit-outbound]
/system script remove [find name=update-reddit-outbound]
/ip dns static remove [find address-list=DST-REDDIT-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-REDDIT-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-REDDIT-TO-OUTBOUND`; use a separate custom address list.
