# Cloud Platforms Category for MikroTik

Install the complete **Cloud Platforms** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-CLOUD-PLATFORMS-TO-OUTBOUND` |
| Update script | `update-cloud-platforms-to-outbound` |
| Daily scheduler | `update-cloud-platforms-to-outbound` |
| Installer | `safe-install/cloud-platforms/safe-install-cloud-platforms-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/cloud-platforms/safe-install-cloud-platforms-to-outbound.rsc" dst-path=safe-install-cloud-platforms-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-cloud-platforms-to-outbound.rsc
/file remove [find name=safe-install-cloud-platforms-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Amazon Web Services](./aws/) | `DST-AWS-TO-OUTBOUND` |
| [Google Cloud](./google-cloud/) | `DST-GOOGLE-CLOUD-TO-OUTBOUND` |
| [Microsoft Azure](./microsoft-azure/) | `DST-MICROSOFT-AZURE-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND
/ip firewall address-list print where list=DST-CLOUD-PLATFORMS-TO-OUTBOUND
/system script print where name=update-cloud-platforms-to-outbound
/system scheduler print where name=update-cloud-platforms-to-outbound
```

Run an update manually:

```routeros
/system script run update-cloud-platforms-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Cloud Platforms to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-cloud-platforms-to-outbound]
/system script remove [find name=update-cloud-platforms-to-outbound]
/ip dns static remove [find address-list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-CLOUD-PLATFORMS-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
