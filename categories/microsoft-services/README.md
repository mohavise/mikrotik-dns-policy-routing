# Microsoft Services Category for MikroTik

Install the complete **Microsoft Services** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-MICROSOFT-SERVICES-TO-OUTBOUND` |
| Update script | `update-microsoft-services-to-outbound` |
| Daily scheduler | `update-microsoft-services-to-outbound` |
| Installer | `safe-install/microsoft-services/safe-install-microsoft-services-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/microsoft-services/safe-install-microsoft-services-to-outbound.rsc" dst-path=safe-install-microsoft-services-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-microsoft-services-to-outbound.rsc
/file remove [find name=safe-install-microsoft-services-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Microsoft 365](./microsoft-365/) | `DST-MICROSOFT-365-TO-OUTBOUND` |
| [OneDrive](./onedrive/) | `DST-ONEDRIVE-TO-OUTBOUND` |
| [Microsoft Teams](./teams/) | `DST-TEAMS-TO-OUTBOUND` |
| [Windows Update](./windows-update/) | `DST-WINDOWS-UPDATE-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND
/ip firewall address-list print where list=DST-MICROSOFT-SERVICES-TO-OUTBOUND
/system script print where name=update-microsoft-services-to-outbound
/system scheduler print where name=update-microsoft-services-to-outbound
```

Run an update manually:

```routeros
/system script run update-microsoft-services-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Microsoft Services to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-microsoft-services-to-outbound]
/system script remove [find name=update-microsoft-services-to-outbound]
/ip dns static remove [find address-list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-MICROSOFT-SERVICES-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
