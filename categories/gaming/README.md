# Gaming Category for MikroTik

Install the complete **Gaming** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-GAMING-TO-OUTBOUND` |
| Update script | `update-gaming-to-outbound` |
| Daily scheduler | `update-gaming-to-outbound` |
| Installer | `safe-install/gaming/safe-install-gaming-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/gaming/safe-install-gaming-to-outbound.rsc" dst-path=safe-install-gaming-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-gaming-to-outbound.rsc
/file remove [find name=safe-install-gaming-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Steam](./steam/) | `DST-STEAM-TO-OUTBOUND` |

To install only one service, open that service folder and use its own README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-GAMING-TO-OUTBOUND
/ip firewall address-list print where list=DST-GAMING-TO-OUTBOUND
/system script print where name=update-gaming-to-outbound
/system scheduler print where name=update-gaming-to-outbound
```

Run an update manually:

```routeros
/system script run update-gaming-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-GAMING-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Gaming to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-gaming-to-outbound]
/system script remove [find name=update-gaming-to-outbound]
/ip dns static remove [find address-list=DST-GAMING-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-GAMING-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
