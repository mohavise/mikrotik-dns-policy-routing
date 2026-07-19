# Google Services Category for MikroTik

Install the complete **Google Services** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-GOOGLE-SERVICES-TO-OUTBOUND` |
| Update script | `update-google-services-to-outbound` |
| Daily scheduler | `update-google-services-to-outbound` |
| Installer | `safe-install/google-services/safe-install-google-services-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/google-services/safe-install-google-services-to-outbound.rsc" dst-path=safe-install-google-services-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-google-services-to-outbound.rsc
/file remove [find name=safe-install-google-services-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Google Drive](./google-drive/) | `DST-GOOGLE-DRIVE-TO-OUTBOUND` |
| [YouTube](./youtube/) | `DST-YOUTUBE-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND
/ip firewall address-list print where list=DST-GOOGLE-SERVICES-TO-OUTBOUND
/system script print where name=update-google-services-to-outbound
/system scheduler print where name=update-google-services-to-outbound
```

Run an update manually:

```routeros
/system script run update-google-services-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Google Services to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-google-services-to-outbound]
/system script remove [find name=update-google-services-to-outbound]
/ip dns static remove [find address-list=DST-GOOGLE-SERVICES-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-GOOGLE-SERVICES-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
