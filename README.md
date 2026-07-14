# MikroTik DNS Policy Routing

![GitHub repo size](https://img.shields.io/github/repo-size/mohavise/mikrotik-dns-policy-routing)
![GitHub last commit](https://img.shields.io/github/last-commit/mohavise/mikrotik-dns-policy-routing)
![GitHub license](https://img.shields.io/github/license/mohavise/mikrotik-dns-policy-routing)

Service-based **MikroTik RouterOS DNS policy routing** lists for routing selected websites, apps, and repositories through a chosen outbound path such as Xray, VPN, WireGuard, WARP, proxy, or WAN2.

This project generates RouterOS DNS Static FWD regex rules, firewall address-list entries, safe updater scripts, and daily schedulers. It is useful when you want selected destinations such as Telegram, WhatsApp, GitHub, OpenAI ChatGPT, YouTube, Docker, Linux repositories, Google Drive, Apple App Store, Google Play, Samsung Galaxy Store, and similar services to use a special route without routing all traffic.

## What This Solves

Many MikroTik networks need split routing:

```text
normal traffic -> normal WAN
selected service traffic -> outbound path chosen by administrator
```

This repository provides managed destination lists that can be used in MikroTik mangle, routing marks, policy routing, and firewall rules.

The repository does not decide the final route. The MikroTik administrator decides which generated list is used in routing rules.

## Routing List Levels

The project supports three levels of lists.

| Level | Purpose | Example list |
| --- | --- | --- |
| Service list | One service only | `DST-TELEGRAM-TO-OUTBOUND` |
| Category profile | Combined services inside one category | `DST-MESSAGING-TO-OUTBOUND` |
| Primary aggregate profile | Optional one-list profile for simple setups | `DST-TO-OUTBOUND` |

Examples:

```text
Telegram service       -> DST-TELEGRAM-TO-OUTBOUND
Messaging category     -> DST-MESSAGING-TO-OUTBOUND
Developer category     -> DST-DEVELOPER-TO-OUTBOUND
AI category            -> DST-AI-TO-OUTBOUND
Primary aggregate      -> DST-TO-OUTBOUND
```

You can install a service list, a category profile, the optional primary aggregate profile, or a mix of them.

## Update Safety

Generated RouterOS output is designed to be repeat-safe and endpoint-safe.

Expected behavior:

```text
run safe install again      -> no duplicate scripts or schedulers
run updater again           -> no duplicate DNS/static/list entries
run scheduled update daily  -> refreshes current repo state
remove domain from repo     -> removed from endpoint on next update
remove CIDR from repo       -> removed from endpoint on next update
remove service from profile -> removed from endpoint on next update
```

Generated repo-managed lists are authoritative for their own target list. Do not manually add custom entries to generated list names such as `DST-TO-OUTBOUND`, `DST-MESSAGING-TO-OUTBOUND`, or `DST-TELEGRAM-TO-OUTBOUND`.

For manual entries, use a separate custom list, for example:

```text
DST-CUSTOM-TO-OUTBOUND
```

## Quick Install

### Optional primary aggregate profile

This installs the optional aggregate profile that creates/updates `DST-TO-OUTBOUND`.

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-outbound.rsc" dst-path=safe-install-outbound.rsc mode=https
/import file-name=safe-install-outbound.rsc
/file remove [find name=safe-install-outbound.rsc]
```

### Category profile example

This installs the messaging category profile that creates/updates `DST-MESSAGING-TO-OUTBOUND`.

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/safe-install-messaging-to-outbound.rsc" dst-path=safe-install-messaging-to-outbound.rsc mode=https
/import file-name=safe-install-messaging-to-outbound.rsc
/file remove [find name=safe-install-messaging-to-outbound.rsc]
```

### Service-only example

This installs only Telegram and creates/updates `DST-TELEGRAM-TO-OUTBOUND`.

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/messaging/telegram/safe-install-telegram-outbound.rsc" dst-path=safe-install-telegram-outbound.rsc mode=https
/import file-name=safe-install-telegram-outbound.rsc
/file remove [find name=safe-install-telegram-outbound.rsc]
```

## Supported Service Lists

| Service | RouterOS list |
| --- | --- |
| Telegram | `DST-TELEGRAM-TO-OUTBOUND` |
| Instagram | `DST-INSTAGRAM-TO-OUTBOUND` |
| WhatsApp | `DST-WHATSAPP-TO-OUTBOUND` |
| Facebook | `DST-FACEBOOK-TO-OUTBOUND` |
| X / Twitter | `DST-X-TO-OUTBOUND` |
| LinkedIn | `DST-LINKEDIN-TO-OUTBOUND` |
| Reddit | `DST-REDDIT-TO-OUTBOUND` |
| Signal | `DST-SIGNAL-TO-OUTBOUND` |
| Discord | `DST-DISCORD-TO-OUTBOUND` |
| Figma | `DST-FIGMA-TO-OUTBOUND` |
| Canva | `DST-CANVA-TO-OUTBOUND` |
| GitHub | `DST-GITHUB-TO-OUTBOUND` |
| OpenAI / ChatGPT | `DST-OPENAI-TO-OUTBOUND` |
| Microsoft 365 | `DST-MICROSOFT-365-TO-OUTBOUND` |
| OneDrive | `DST-ONEDRIVE-TO-OUTBOUND` |
| Microsoft Teams | `DST-TEAMS-TO-OUTBOUND` |
| Windows Update | `DST-WINDOWS-UPDATE-TO-OUTBOUND` |
| Ubuntu repositories | `DST-UBUNTU-TO-OUTBOUND` |
| Debian repositories | `DST-DEBIAN-TO-OUTBOUND` |
| Red Hat repositories | `DST-REDHAT-TO-OUTBOUND` |
| Proxmox repositories | `DST-PROXMOX-TO-OUTBOUND` |
| Docker repositories | `DST-DOCKER-TO-OUTBOUND` |
| Google Drive | `DST-GOOGLE-DRIVE-TO-OUTBOUND` |
| YouTube | `DST-YOUTUBE-TO-OUTBOUND` |
| Spotify | `DST-SPOTIFY-TO-OUTBOUND` |
| Steam | `DST-STEAM-TO-OUTBOUND` |
| Apple App Store | `DST-APPLE-APP-STORE-TO-OUTBOUND` |
| Google Play | `DST-GOOGLE-PLAY-TO-OUTBOUND` |
| Samsung Galaxy Store | `DST-SAMSUNG-GALAXY-STORE-TO-OUTBOUND` |
| Wise | `DST-WISE-TO-OUTBOUND` |
| Amazon Web Services | `DST-AWS-TO-OUTBOUND` |
| Microsoft Azure | `DST-MICROSOFT-AZURE-TO-OUTBOUND` |
| Google Cloud | `DST-GOOGLE-CLOUD-TO-OUTBOUND` |

## Supported Category Profiles

| Category profile | RouterOS list |
| --- | --- |
| AI | `DST-AI-TO-OUTBOUND` |
| Developer | `DST-DEVELOPER-TO-OUTBOUND` |
| Package repositories | `DST-PACKAGE-REPOSITORIES-TO-OUTBOUND` |
| Google services | `DST-GOOGLE-SERVICES-TO-OUTBOUND` |
| Microsoft services | `DST-MICROSOFT-SERVICES-TO-OUTBOUND` |
| Music | `DST-MUSIC-TO-OUTBOUND` |
| Gaming | `DST-GAMING-TO-OUTBOUND` |
| Mobile app store | `DST-MOBILE-APP-STORE-TO-OUTBOUND` |
| Messaging | `DST-MESSAGING-TO-OUTBOUND` |
| Social media | `DST-SOCIAL-MEDIA-TO-OUTBOUND` |
| Design | `DST-DESIGN-TO-OUTBOUND` |
| Financial services | `DST-FINANCIAL-SERVICES-TO-OUTBOUND` |
| Cloud platforms | `DST-CLOUD-PLATFORMS-TO-OUTBOUND` |
| Optional primary aggregate | `DST-TO-OUTBOUND` |

## Repository Structure

```text
safe-install-outbound.rsc        optional primary aggregate installer
safe-install/<category>/         service and category safe installers
categories/<category>/           active service and category profile source
docs/                            naming, source, and migration notes
scripts/build-all.sh             build all generated RouterOS outputs
scripts/validate-all.sh          validate generated outputs and safety rules
scripts/audit-migration.sh       repository structure audit
```

Active service folders use this pattern:

```text
categories/<category-id>/<service-id>/
categories/<category-id>/<category-id>-to-outbound/
```

The old `services/`, `groups/`, and `profiles/` implementation folders were removed after migration to the category-first structure.

## Generated Files

Each service or category profile can contain:

```text
output/list-domains.rsc       DNS Static FWD regex rules
output/list-cidr.rsc          firewall address-list CIDR rules
output/list-all.rsc           combined import file
routeros/update.rsc           repeat-safe updater script
routeros/scheduler.rsc        daily scheduler installer
```

Build and validation logic is centralized in the repository root `scripts/` directory.

## DNS And Domain Rules

MikroTik database files must contain normal domains only:

```text
domain.com
example.org
```

Do not add wildcard format to MikroTik database files:

```text
*.domain.com
```

The generator creates RouterOS regex rules that match both the root domain and subdomains.

Wildcard format is reserved for possible future non-MikroTik exporters such as FortiGate.

## Build And Validate

```sh
./scripts/audit-migration.sh
./scripts/build-all.sh
./scripts/validate-all.sh
```

The build process also post-processes generated RouterOS outputs to keep updates authoritative. The validation process checks generated output safety, updater repeat-safety, and scheduler repeat-safety.

## GitHub Automation

The GitHub Actions workflow is:

```text
.github/workflows/update-generated-lists.yml
```

It can be run manually and also updates generated outputs automatically when the workflow runs.

## Adding New Services

New services must be added under category-first paths:

```text
categories/<category-id>/<service-id>/
```

Rules:

- Do not add broad CDN or cloud-hosting lists, public provider IP ranges, or generic customer workload domains.
- A cloud provider may have a tightly scoped control-plane service for its first-party website, documentation, sign-in, console, and management dependencies.
- Service-owned CDN-looking hostnames may stay only when required by official service documentation.
- Keep real domain/CIDR data inside service database folders.
- Category profiles should reference services by service ID.
- Add safe installers under `safe-install/<category-id>/`, not in the repository root.

More details:

```text
docs/add-new-service.md
docs/NAMING.md
docs/SOURCES.md
docs/supported-services.md
docs/STRUCTURE-MIGRATION.md
```

## Search Keywords

MikroTik DNS policy routing, RouterOS DNS Static FWD, MikroTik address-list automation, MikroTik split tunneling, MikroTik service-based routing, route selected websites through VPN, route selected services through Xray, WireGuard policy routing, RouterOS firewall address-list updater, MikroTik Telegram routing, MikroTik GitHub routing, MikroTik OpenAI ChatGPT routing, MikroTik YouTube routing.

## License

MIT
