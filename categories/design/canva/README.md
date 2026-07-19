# Canva for MikroTik

Install only the **Canva** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-CANVA-TO-OUTBOUND` |
| Update script | `update-canva-outbound` |
| Daily scheduler | `update-canva-outbound` |
| Installer | `safe-install/design/canva/safe-install-canva-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/design/canva/safe-install-canva-outbound.rsc" dst-path=safe-install-canva-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-canva-outbound.rsc
/file remove [find name=safe-install-canva-outbound.rsc]
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
/ip dns static print where address-list=DST-CANVA-TO-OUTBOUND
/ip firewall address-list print where list=DST-CANVA-TO-OUTBOUND
/system script print where name=update-canva-outbound
/system scheduler print where name=update-canva-outbound
```

Run an update manually:

```routeros
/system script run update-canva-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-CANVA-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Canva to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-canva-outbound]
/system script remove [find name=update-canva-outbound]
/ip dns static remove [find address-list=DST-CANVA-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-CANVA-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-CANVA-TO-OUTBOUND`; use a separate custom address list.
