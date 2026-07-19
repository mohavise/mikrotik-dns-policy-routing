# X for MikroTik

Install only the **X** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-X-TO-OUTBOUND` |
| Update script | `update-x-outbound` |
| Daily scheduler | `update-x-outbound` |
| Installer | `safe-install/social-media/x/safe-install-x-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/social-media/x/safe-install-x-outbound.rsc" dst-path=safe-install-x-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-x-outbound.rsc
/file remove [find name=safe-install-x-outbound.rsc]
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
/ip dns static print where address-list=DST-X-TO-OUTBOUND
/ip firewall address-list print where list=DST-X-TO-OUTBOUND
/system script print where name=update-x-outbound
/system scheduler print where name=update-x-outbound
```

Run an update manually:

```routeros
/system script run update-x-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-X-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="X to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-x-outbound]
/system script remove [find name=update-x-outbound]
/ip dns static remove [find address-list=DST-X-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-X-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-X-TO-OUTBOUND`; use a separate custom address list.
