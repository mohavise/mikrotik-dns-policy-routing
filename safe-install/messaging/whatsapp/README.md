# WhatsApp for MikroTik

Install only the **WhatsApp** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-WHATSAPP-TO-OUTBOUND` |
| Update script | `update-whatsapp-outbound` |
| Daily scheduler | `update-whatsapp-outbound` |
| Installer | `safe-install/messaging/whatsapp/safe-install-whatsapp-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/whatsapp/safe-install-whatsapp-outbound.rsc" dst-path=safe-install-whatsapp-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-whatsapp-outbound.rsc
/file remove [find name=safe-install-whatsapp-outbound.rsc]
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
/ip dns static print where address-list=DST-WHATSAPP-TO-OUTBOUND
/ip firewall address-list print where list=DST-WHATSAPP-TO-OUTBOUND
/system script print where name=update-whatsapp-outbound
/system scheduler print where name=update-whatsapp-outbound
```

Run an update manually:

```routeros
/system script run update-whatsapp-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-WHATSAPP-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="WhatsApp to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-whatsapp-outbound]
/system script remove [find name=update-whatsapp-outbound]
/ip dns static remove [find address-list=DST-WHATSAPP-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-WHATSAPP-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-WHATSAPP-TO-OUTBOUND`; use a separate custom address list.
