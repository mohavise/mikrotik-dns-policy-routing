# Developer Category for MikroTik

Install the complete **Developer** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-DEVELOPER-TO-OUTBOUND` |
| Update script | `update-developer-to-outbound` |
| Daily scheduler | `update-developer-to-outbound` |
| Installer | `safe-install/developer/safe-install-developer-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/developer/safe-install-developer-to-outbound.rsc" dst-path=safe-install-developer-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-developer-to-outbound.rsc
/file remove [find name=safe-install-developer-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [GitHub](./github/) | `DST-GITHUB-TO-OUTBOUND` |

To install only one service, open that service folder and use its own README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-DEVELOPER-TO-OUTBOUND
/ip firewall address-list print where list=DST-DEVELOPER-TO-OUTBOUND
/system script print where name=update-developer-to-outbound
/system scheduler print where name=update-developer-to-outbound
```

Run an update manually:

```routeros
/system script run update-developer-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-DEVELOPER-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Developer to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-developer-to-outbound]
/system script remove [find name=update-developer-to-outbound]
/ip dns static remove [find address-list=DST-DEVELOPER-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-DEVELOPER-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
