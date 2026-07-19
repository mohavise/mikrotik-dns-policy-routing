# Package Repositories Category for MikroTik

Install the complete **Package Repositories** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-PACKAGE-REPOSITORIES-TO-OUTBOUND` |
| Update script | `update-package-repositories-to-outbound` |
| Daily scheduler | `update-package-repositories-to-outbound` |
| Installer | `safe-install/package-repositories/safe-install-package-repositories-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/package-repositories/safe-install-package-repositories-to-outbound.rsc" dst-path=safe-install-package-repositories-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-package-repositories-to-outbound.rsc
/file remove [find name=safe-install-package-repositories-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Ubuntu](./ubuntu/) | `DST-UBUNTU-TO-OUTBOUND` |
| [Debian](./debian/) | `DST-DEBIAN-TO-OUTBOUND` |
| [Red Hat](./redhat/) | `DST-REDHAT-TO-OUTBOUND` |
| [Proxmox](./proxmox/) | `DST-PROXMOX-TO-OUTBOUND` |
| [Docker](./docker/) | `DST-DOCKER-TO-OUTBOUND` |

To install only one service, open that service folder and use its own README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
/ip firewall address-list print where list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
/system script print where name=update-package-repositories-to-outbound
/system scheduler print where name=update-package-repositories-to-outbound
```

Run an update manually:

```routeros
/system script run update-package-repositories-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Package Repositories to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-package-repositories-to-outbound]
/system script remove [find name=update-package-repositories-to-outbound]
/ip dns static remove [find address-list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-PACKAGE-REPOSITORIES-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
