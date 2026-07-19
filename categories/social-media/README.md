# Social Media Category for MikroTik

Install the complete **Social Media** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-SOCIAL-MEDIA-TO-OUTBOUND` |
| Update script | `update-social-media-to-outbound` |
| Daily scheduler | `update-social-media-to-outbound` |
| Installer | `safe-install/social-media/safe-install-social-media-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/social-media/safe-install-social-media-to-outbound.rsc" dst-path=safe-install-social-media-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-social-media-to-outbound.rsc
/file remove [find name=safe-install-social-media-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Instagram](./instagram/) | `DST-INSTAGRAM-TO-OUTBOUND` |
| [Facebook](./facebook/) | `DST-FACEBOOK-TO-OUTBOUND` |
| [X](./x/) | `DST-X-TO-OUTBOUND` |
| [LinkedIn](./linkedin/) | `DST-LINKEDIN-TO-OUTBOUND` |
| [Reddit](./reddit/) | `DST-REDDIT-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND
/ip firewall address-list print where list=DST-SOCIAL-MEDIA-TO-OUTBOUND
/system script print where name=update-social-media-to-outbound
/system scheduler print where name=update-social-media-to-outbound
```

Run an update manually:

```routeros
/system script run update-social-media-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Social Media to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-social-media-to-outbound]
/system script remove [find name=update-social-media-to-outbound]
/ip dns static remove [find address-list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-SOCIAL-MEDIA-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
