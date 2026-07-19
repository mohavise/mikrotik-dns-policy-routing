# Messaging Category for MikroTik

Install the complete **Messaging** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-MESSAGING-TO-OUTBOUND` |
| Update script | `update-messaging-to-outbound` |
| Daily scheduler | `update-messaging-to-outbound` |
| Installer | `safe-install/messaging/safe-install-messaging-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/safe-install-messaging-to-outbound.rsc" dst-path=safe-install-messaging-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-messaging-to-outbound.rsc
/file remove [find name=safe-install-messaging-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Telegram](./telegram/) | `DST-TELEGRAM-TO-OUTBOUND` |
| [WhatsApp](./whatsapp/) | `DST-WHATSAPP-TO-OUTBOUND` |
| [Signal](./signal/) | `DST-SIGNAL-TO-OUTBOUND` |
| [Discord](./discord/) | `DST-DISCORD-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-MESSAGING-TO-OUTBOUND
/ip firewall address-list print where list=DST-MESSAGING-TO-OUTBOUND
/system script print where name=update-messaging-to-outbound
/system scheduler print where name=update-messaging-to-outbound
```

Run an update manually:

```routeros
/system script run update-messaging-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-MESSAGING-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Messaging to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-messaging-to-outbound]
/system script remove [find name=update-messaging-to-outbound]
/ip dns static remove [find address-list=DST-MESSAGING-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-MESSAGING-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
