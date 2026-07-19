# MikroTik DNS Policy Routing

Service-based RouterOS destination lists for routing selected websites and applications through Xray, VPN, WireGuard, WARP, another WAN, or another administrator-defined outbound path.

```text
service domains and CIDRs
        ↓
generated RouterOS DNS static and address-list rules
        ↓
service, category, or aggregate destination list
        ↓
MikroTik policy routing chosen by the administrator
```

The repository creates destination lists only. It does not create your gateway, routing table, mangle policy, or VPN connection.

## List Levels

| Level | Example |
| --- | --- |
| Service | `DST-TELEGRAM-TO-OUTBOUND` |
| Category | `DST-MESSAGING-TO-OUTBOUND` |
| Primary aggregate | `DST-TO-OUTBOUND` |

Generated lists are authoritative for their own names. Keep manual entries in a separate list such as `DST-CUSTOM-TO-OUTBOUND`.

## Installation Guides

Open a category guide to install the complete category or select an individual service.

| Category | Installation guide |
| --- | --- |
| AI | [Category and services](safe-install/ai/) |
| Cloud platforms | [Category and services](safe-install/cloud-platforms/) |
| Design | [Category and services](safe-install/design/) |
| Developer | [Category and services](safe-install/developer/) |
| Financial services | [Category and services](safe-install/financial-services/) |
| Gaming | [Category and services](safe-install/gaming/) |
| Google services | [Category and services](safe-install/google-services/) |
| Messaging | [Category and services](safe-install/messaging/) |
| Microsoft services | [Category and services](safe-install/microsoft-services/) |
| Mobile app stores | [Category and services](safe-install/mobile-app-store/) |
| Music | [Category and services](safe-install/music/) |
| Network tools | [Individual services](safe-install/network-tools/) |
| Package repositories | [Category and services](safe-install/package-repositories/) |
| Social media | [Category and services](safe-install/social-media/) |

## Install Primary Aggregate

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-outbound.rsc" dst-path="safe-install-outbound.rsc" check-certificate=yes-without-crl
/import file-name="safe-install-outbound.rsc"
/file remove [find name="safe-install-outbound.rsc"]
```

This installs the updater and scheduler for `DST-TO-OUTBOUND`.

## Install a Category

Messaging example:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/safe-install-messaging-to-outbound.rsc" dst-path="safe-install-messaging-to-outbound.rsc" check-certificate=yes-without-crl
/import file-name="safe-install-messaging-to-outbound.rsc"
/file remove [find name="safe-install-messaging-to-outbound.rsc"]
```

## Install One Service

Telegram example:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/telegram/safe-install-telegram-outbound.rsc" dst-path="safe-install-telegram-outbound.rsc" check-certificate=yes-without-crl
/import file-name="safe-install-telegram-outbound.rsc"
/file remove [find name="safe-install-telegram-outbound.rsc"]
```

## Generated Files

Each service or category may contain:

```text
output/list-domains.rsc
output/list-cidr.rsc
output/list-all.rsc
routeros/update.rsc
routeros/scheduler.rsc
```

DNS rules use RouterOS `type=FWD` with an `address-list`. CIDR rules use `/ip firewall address-list`.

Clients must use the MikroTik router as DNS for DNS-learned destination addresses to populate:

```routeros
/ip dns set allow-remote-requests=yes
```

## Build and Validate

```bash
sh ./scripts/audit-migration.sh
sh ./scripts/build-all.sh
sh ./scripts/validate-all.sh
```

The build pipeline checks:

```text
HTTPS-only external sources
download retries and timeouts
strict domain syntax
IPv4 CIDR octets and prefix lengths
minimum service counts
20% sudden-drop protection
deterministic sorted output
no duplicate generated rules
combined-output entry consistency
authoritative cleanup safety
repository migration structure
```

Generated files do not include timestamps, so unchanged source data does not create unnecessary commits.

## RouterOS Installer Safety

The primary safe installer:

```text
removes stale temporary files
uses HTTPS certificate verification
downloads updater and scheduler files
checks that each file exists
dry-runs each RouterOS import
imports only after validation
cleans temporary files on success or failure
runs the first update
```

## GitHub Automation

Workflow:

```text
.github/workflows/update-generated-lists.yml
```

It runs daily at `23:30 UTC` and supports manual execution. The workflow audits the repository, rebuilds all lists and installation guides, validates generated output, commits only real changes, prevents overlapping runs, and rebases before pushing.

## Repository Structure

```text
categories/<category>/<service>/
categories/<category>/<category>-to-outbound/
categories/primary/primary-to-outbound/
safe-install/<category>/
safe-install/<category>/<service>/
scripts/
docs/
```

Database domain files must contain normal domains only:

```text
example.com
service.example.org
```

Do not use `*.example.com`; the generator creates regex rules that match the root and its subdomains.

Do not add broad public cloud ranges, generic CDN ranges, or unrelated customer workloads. Use only service-owned or tightly scoped dependencies required for the intended service.

More documentation:

```text
docs/add-new-service.md
docs/NAMING.md
docs/SOURCES.md
docs/supported-services.md
docs/STRUCTURE-MIGRATION.md
```

## License

MIT
