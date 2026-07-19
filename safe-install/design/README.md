# Design Category for MikroTik

Install the complete **Design** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-DESIGN-TO-OUTBOUND` |
| Update script | `update-design-to-outbound` |
| Daily scheduler | `update-design-to-outbound` |
| Installer | `safe-install/design/safe-install-design-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/design/safe-install-design-to-outbound.rsc" dst-path=safe-install-design-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-design-to-outbound.rsc
/file remove [find name=safe-install-design-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Figma](./figma/) | `DST-FIGMA-TO-OUTBOUND` |
| [Canva](./canva/) | `DST-CANVA-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-DESIGN-TO-OUTBOUND
/ip firewall address-list print where list=DST-DESIGN-TO-OUTBOUND
/system script print where name=update-design-to-outbound
/system scheduler print where name=update-design-to-outbound
```

Run an update manually:

```routeros
/system script run update-design-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-DESIGN-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Design to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-design-to-outbound]
/system script remove [find name=update-design-to-outbound]
/ip dns static remove [find address-list=DST-DESIGN-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-DESIGN-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
