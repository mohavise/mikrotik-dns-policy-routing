# Financial Services Category for MikroTik

Install the complete **Financial Services** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-FINANCIAL-SERVICES-TO-OUTBOUND` |
| Update script | `update-financial-services-to-outbound` |
| Daily scheduler | `update-financial-services-to-outbound` |
| Installer | `safe-install/financial-services/safe-install-financial-services-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/financial-services/safe-install-financial-services-to-outbound.rsc" dst-path=safe-install-financial-services-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-financial-services-to-outbound.rsc
/file remove [find name=safe-install-financial-services-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Wise](./wise/) | `DST-WISE-TO-OUTBOUND` |

To install only one service, open that service folder and use its own README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND
/ip firewall address-list print where list=DST-FINANCIAL-SERVICES-TO-OUTBOUND
/system script print where name=update-financial-services-to-outbound
/system scheduler print where name=update-financial-services-to-outbound
```

Run an update manually:

```routeros
/system script run update-financial-services-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Financial Services to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-financial-services-to-outbound]
/system script remove [find name=update-financial-services-to-outbound]
/ip dns static remove [find address-list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-FINANCIAL-SERVICES-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
