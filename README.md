# MikroTik DNS Policy Routing

![GitHub repo size](https://img.shields.io/github/repo-size/mohavise/mikrotik-dns-policy-routing)
![GitHub last commit](https://img.shields.io/github/last-commit/mohavise/mikrotik-dns-policy-routing)
![GitHub license](https://img.shields.io/github/license/mohavise/mikrotik-dns-policy-routing)

Service-based MikroTik RouterOS DNS policy routing lists with regex, address-lists, safe updaters, and schedulers.

This repository builds RouterOS DNS Static FWD regex rules and firewall address-list imports for routing selected services through a custom outbound path such as Xray, VPN, WireGuard, WARP, proxy, or WAN2.

It is useful for MikroTik administrators who want service-based routing for destinations such as Telegram, WhatsApp, GitHub, OpenAI ChatGPT, YouTube, Docker, Linux repositories, Google Drive, Apple App Store, Google Play, and other applications without routing all traffic.

## Purpose

```text
service domains + optional CIDR -> DST-<GROUP>-TO-<TARGET> -> mangle -> route target
```

This repository is designed like an adblock/IP-list repo with category-first service folders:

```text
service database -> generator script -> service output -> MikroTik updater script -> scheduler
```

The category-first routing model has three layers:

```text
category service -> category profile -> MikroTik route target
```

```text
Service          = what the destination is
Category profile = what category target it belongs to
Route target     = where MikroTik should route it
```

MikroTik address-list naming pattern:

```text
DST-<GROUP>-TO-<TARGET>
```

Examples:

```text
DST-TELEGRAM-TO-OUTBOUND
DST-INSTAGRAM-TO-OUTBOUND
DST-WHATSAPP-TO-OUTBOUND
DST-FACEBOOK-TO-OUTBOUND
DST-SOCIAL-MEDIA-TO-OUTBOUND
DST-TO-OUTBOUND
```

## What Problem Does This Solve?

Many MikroTik networks need to route only selected services through a special outbound path while normal traffic stays on the default WAN.

This project helps build and update destination lists for those services using:

- RouterOS DNS Static FWD regex rules
- MikroTik firewall address-lists
- service folders
- generated `.rsc` import files
- safe update scripts
- daily schedulers

## Structure

New development uses the category-first structure. Active migrated categories live under `categories/<category-id>/`:

```text
categories/<category-id>/<service-id>/
categories/<category-id>/<category-id>-to-outbound/
```

For example, Apple App Store and Google Play are active from:

```text
categories/mobile-app-store/apple-app-store/
categories/mobile-app-store/google-play/
categories/mobile-app-store/mobile-app-store-to-outbound/
```

The older `services/`, `groups/`, and `profiles/` implementation folders were removed after the category-first migration. Root `safe-install-*.rsc` files remain as compatibility wrappers.

Do not add new services under legacy paths. See `STRUCTURE-MIGRATION.md` for historical migration notes and the service-to-category map.

```text
safe-install-*.rsc            root MikroTik entry points
categories/<category>/        category-first services and profiles
docs/                         naming and source rules
scripts/build-all.sh          root build orchestrator
scripts/validate-all.sh       root validation orchestrator
scripts/audit-migration.sh    category-first migration audit
```

The repository root only keeps safe installers as MikroTik entry points. Active migrated service files live under `categories/<category-id>/<service-id>/`.
RouterOS updater and scheduler imports are repeat-safe: they remove the existing script or scheduler with the same name before adding the current version.

## Supported Services

Current supported services include Telegram, Instagram, WhatsApp, Facebook, X/Twitter, LinkedIn, Signal, Figma, Canva, GitHub, OpenAI ChatGPT, Ubuntu repositories, Debian repositories, Red Hat repositories, Proxmox repositories, Docker, Google Drive, YouTube, Spotify, Steam, Apple App Store, and Google Play.

| Service | Address list | Source approach |
| --- | --- |
| Telegram | `DST-TELEGRAM-TO-OUTBOUND` | community domains + official Telegram CIDR |
| Instagram | `DST-INSTAGRAM-TO-OUTBOUND` | Meta-owned public domains |
| WhatsApp | `DST-WHATSAPP-TO-OUTBOUND` | Meta-owned public domains |
| Facebook | `DST-FACEBOOK-TO-OUTBOUND` | Meta-owned public domains |
| X/Twitter | `DST-X-TO-OUTBOUND` | X-owned public domains |
| LinkedIn | `DST-LINKEDIN-TO-OUTBOUND` | LinkedIn-owned public domains |
| Signal | `DST-SIGNAL-TO-OUTBOUND` | Signal-owned public domains |
| Figma | `DST-FIGMA-TO-OUTBOUND` | Figma-owned public/service domains |
| Canva | `DST-CANVA-TO-OUTBOUND` | Canva-owned public/service domains |
| GitHub | `DST-GITHUB-TO-OUTBOUND` | GitHub-owned public/service domains |
| OpenAI / ChatGPT | `DST-OPENAI-TO-OUTBOUND` | OpenAI official ChatGPT network recommendations |
| Ubuntu repositories | `DST-UBUNTU-TO-OUTBOUND` | Ubuntu package repository domains |
| Debian repositories | `DST-DEBIAN-TO-OUTBOUND` | Debian mirror/repository domains |
| Red Hat repositories | `DST-REDHAT-TO-OUTBOUND` | Red Hat RHSM/CDN/registry domains |
| Proxmox repositories | `DST-PROXMOX-TO-OUTBOUND` | Proxmox package repository domains |
| Docker repositories | `DST-DOCKER-TO-OUTBOUND` | Docker official allowlist domains |
| Google Drive | `DST-GOOGLE-DRIVE-TO-OUTBOUND` | Google Drive public/service domains |
| YouTube | `DST-YOUTUBE-TO-OUTBOUND` | YouTube public/service domains |
| Spotify | `DST-SPOTIFY-TO-OUTBOUND` | Spotify public/service domains |
| Steam | `DST-STEAM-TO-OUTBOUND` | Steam and Valve public/service domains |
| Apple App Store | `DST-APPLE-APP-STORE-TO-OUTBOUND` | Apple official app store/content hosts |
| Google Play | `DST-GOOGLE-PLAY-TO-OUTBOUND` | Google official Android Enterprise and Managed Google Play endpoints |
| AI profile | `DST-AI-TO-OUTBOUND` | Combined AI services |
| Developer profile | `DST-DEVELOPER-TO-OUTBOUND` | Combined developer services |
| Package Repositories profile | `DST-PACKAGE-REPOSITORIES-TO-OUTBOUND` | Combined Linux package and container repository services |
| Google Services profile | `DST-GOOGLE-SERVICES-TO-OUTBOUND` | Combined Google-owned services |
| Cloud Storage profile | `DST-CLOUD-STORAGE-TO-OUTBOUND` | Combined cloud storage services |
| Video Streaming profile | `DST-VIDEO-STREAMING-TO-OUTBOUND` | Combined video streaming services |
| Music profile | `DST-MUSIC-TO-OUTBOUND` | Combined music services |
| Gaming profile | `DST-GAMING-TO-OUTBOUND` | Combined gaming services |
| Mobile App Store profile | `DST-MOBILE-APP-STORE-TO-OUTBOUND` | Combined mobile app store services |
| Messaging profile | `DST-MESSAGING-TO-OUTBOUND` | Combined messaging services |
| Social Media profile | `DST-SOCIAL-MEDIA-TO-OUTBOUND` | Combined strict social-media services |
| Design profile | `DST-DESIGN-TO-OUTBOUND` | Combined design and visual collaboration services |
| Primary profile | `DST-TO-OUTBOUND` | Combined selected outbound destinations |

## Safe Installers And Example Files

| File | Purpose |
| --- | --- |
| `safe-install-telegram-outbound.rsc` | Root installer that fetches Telegram updater + scheduler and runs once |
| `safe-install-instagram-outbound.rsc` | Root installer that fetches Instagram updater + scheduler and runs once |
| `safe-install-whatsapp-outbound.rsc` | Root installer that fetches WhatsApp updater + scheduler and runs once |
| `safe-install-facebook-outbound.rsc` | Root installer that fetches Facebook updater + scheduler and runs once |
| `safe-install-x-outbound.rsc` | Root installer that fetches X updater + scheduler and runs once |
| `safe-install-linkedin-outbound.rsc` | Root installer that fetches LinkedIn updater + scheduler and runs once |
| `safe-install-signal-outbound.rsc` | Root installer that fetches Signal updater + scheduler and runs once |
| `safe-install-figma-outbound.rsc` | Root installer that fetches Figma updater + scheduler and runs once |
| `safe-install-canva-outbound.rsc` | Root installer that fetches Canva updater + scheduler and runs once |
| `safe-install-github-outbound.rsc` | Root installer that fetches GitHub updater + scheduler and runs once |
| `safe-install-openai-outbound.rsc` | Root installer that fetches OpenAI updater + scheduler and runs once |
| `safe-install-ubuntu-outbound.rsc` | Root installer that fetches Ubuntu updater + scheduler and runs once |
| `safe-install-debian-outbound.rsc` | Root installer that fetches Debian updater + scheduler and runs once |
| `safe-install-redhat-outbound.rsc` | Root installer that fetches Red Hat updater + scheduler and runs once |
| `safe-install-proxmox-outbound.rsc` | Root installer that fetches Proxmox updater + scheduler and runs once |
| `safe-install-docker-outbound.rsc` | Root installer that fetches Docker updater + scheduler and runs once |
| `safe-install-google-drive-outbound.rsc` | Root installer that fetches Google Drive updater + scheduler and runs once |
| `safe-install-youtube-outbound.rsc` | Root installer that fetches YouTube updater + scheduler and runs once |
| `safe-install-spotify-outbound.rsc` | Root installer that fetches Spotify updater + scheduler and runs once |
| `safe-install-steam-outbound.rsc` | Root installer that fetches Steam updater + scheduler and runs once |
| `safe-install-apple-app-store-outbound.rsc` | Root installer that fetches Apple App Store updater + scheduler and runs once |
| `safe-install-google-play-outbound.rsc` | Root installer that fetches Google Play updater + scheduler and runs once |
| `safe-install-ai-outbound.rsc` | Root installer that fetches the combined AI updater + scheduler and runs once |
| `safe-install-developer-outbound.rsc` | Root installer that fetches the combined developer updater + scheduler and runs once |
| `safe-install-package-repositories-outbound.rsc` | Root installer that fetches the combined package repositories updater + scheduler and runs once |
| `safe-install-google-services-outbound.rsc` | Root installer that fetches the combined Google services updater + scheduler and runs once |
| `safe-install-cloud-storage-outbound.rsc` | Root installer that fetches the combined cloud storage updater + scheduler and runs once |
| `safe-install-video-streaming-outbound.rsc` | Root installer that fetches the combined video streaming updater + scheduler and runs once |
| `safe-install-music-outbound.rsc` | Root installer that fetches the combined music updater + scheduler and runs once |
| `safe-install-gaming-outbound.rsc` | Root installer that fetches the combined gaming updater + scheduler and runs once |
| `safe-install-mobile-app-store-outbound.rsc` | Root installer that fetches the combined mobile app store updater + scheduler and runs once |
| `safe-install-messaging-outbound.rsc` | Root installer that fetches the combined messaging updater + scheduler and runs once |
| `safe-install-social-media-outbound.rsc` | Root installer that fetches the combined social-media updater + scheduler and runs once |
| `safe-install-design-outbound.rsc` | Root installer that fetches the combined design updater + scheduler and runs once |
| `safe-install-outbound.rsc` | Root installer that fetches the primary outbound updater + scheduler and runs once |
| `categories/messaging/telegram/output/list-domains.rsc` | Telegram DNS Static FWD rules |
| `categories/messaging/telegram/output/list-cidr.rsc` | Telegram CIDR address-list rules |
| `categories/messaging/telegram/output/list-all.rsc` | Combined domains + CIDR import file |
| `categories/messaging/telegram/routeros/update.rsc` | MikroTik update script |
| `categories/messaging/telegram/routeros/scheduler.rsc` | MikroTik daily scheduler |

## RouterOS List Names

```text
DST-TELEGRAM-TO-OUTBOUND
DST-INSTAGRAM-TO-OUTBOUND
DST-WHATSAPP-TO-OUTBOUND
DST-FACEBOOK-TO-OUTBOUND
DST-X-TO-OUTBOUND
DST-LINKEDIN-TO-OUTBOUND
DST-SIGNAL-TO-OUTBOUND
DST-FIGMA-TO-OUTBOUND
DST-CANVA-TO-OUTBOUND
DST-GITHUB-TO-OUTBOUND
DST-OPENAI-TO-OUTBOUND
DST-UBUNTU-TO-OUTBOUND
DST-DEBIAN-TO-OUTBOUND
DST-REDHAT-TO-OUTBOUND
DST-PROXMOX-TO-OUTBOUND
DST-DOCKER-TO-OUTBOUND
DST-GOOGLE-DRIVE-TO-OUTBOUND
DST-YOUTUBE-TO-OUTBOUND
DST-SPOTIFY-TO-OUTBOUND
DST-STEAM-TO-OUTBOUND
DST-APPLE-APP-STORE-TO-OUTBOUND
DST-GOOGLE-PLAY-TO-OUTBOUND
DST-AI-TO-OUTBOUND
DST-DEVELOPER-TO-OUTBOUND
DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
DST-GOOGLE-SERVICES-TO-OUTBOUND
DST-CLOUD-STORAGE-TO-OUTBOUND
DST-VIDEO-STREAMING-TO-OUTBOUND
DST-MUSIC-TO-OUTBOUND
DST-GAMING-TO-OUTBOUND
DST-MOBILE-APP-STORE-TO-OUTBOUND
DST-MESSAGING-TO-OUTBOUND
DST-SOCIAL-MEDIA-TO-OUTBOUND
DST-DESIGN-TO-OUTBOUND
DST-TO-OUTBOUND
```

## Safe Install

Telegram example:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-telegram-outbound.rsc" dst-path=safe-install-telegram-outbound.rsc mode=https
/import file-name=safe-install-telegram-outbound.rsc
/file remove [find name=safe-install-telegram-outbound.rsc]
```

Primary outbound profile example:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-outbound.rsc" dst-path=safe-install-outbound.rsc mode=https
/import file-name=safe-install-outbound.rsc
/file remove [find name=safe-install-outbound.rsc]
```

Other safe installers:

```text
safe-install-instagram-outbound.rsc
safe-install-whatsapp-outbound.rsc
safe-install-facebook-outbound.rsc
safe-install-x-outbound.rsc
safe-install-linkedin-outbound.rsc
safe-install-signal-outbound.rsc
safe-install-figma-outbound.rsc
safe-install-canva-outbound.rsc
safe-install-github-outbound.rsc
safe-install-openai-outbound.rsc
safe-install-ubuntu-outbound.rsc
safe-install-debian-outbound.rsc
safe-install-redhat-outbound.rsc
safe-install-proxmox-outbound.rsc
safe-install-docker-outbound.rsc
safe-install-google-drive-outbound.rsc
safe-install-youtube-outbound.rsc
safe-install-spotify-outbound.rsc
safe-install-steam-outbound.rsc
safe-install-apple-app-store-outbound.rsc
safe-install-google-play-outbound.rsc
safe-install-ai-outbound.rsc
safe-install-developer-outbound.rsc
safe-install-package-repositories-outbound.rsc
safe-install-google-services-outbound.rsc
safe-install-cloud-storage-outbound.rsc
safe-install-video-streaming-outbound.rsc
safe-install-music-outbound.rsc
safe-install-gaming-outbound.rsc
safe-install-mobile-app-store-outbound.rsc
safe-install-messaging-outbound.rsc
safe-install-social-media-outbound.rsc
safe-install-design-outbound.rsc
safe-install-outbound.rsc
```

## Manual Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/messaging/telegram/routeros/update.rsc" dst-path=update-telegram-outbound.rsc mode=https
/import file-name=update-telegram-outbound.rsc
/system script run update-telegram-outbound
```

## Scheduler Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/categories/messaging/telegram/routeros/scheduler.rsc" dst-path=scheduler-update-telegram-outbound.rsc mode=https
/import file-name=scheduler-update-telegram-outbound.rsc
/file remove [find name=scheduler-update-telegram-outbound.rsc]
```

Default schedule:

```text
04:01:00 services
04:06:00 group/profile lists
04:11:00 primary outbound list
```

## GitHub Automation

Workflow:

```text
.github/workflows/update-generated-lists.yml
```

It runs every day at `23:30 UTC` and can be started manually from GitHub Actions.

Update flow:

```text
scripts/build-all.sh -> scripts/validate-all.sh -> commit generated outputs if changed
```

Maintainer migration audit:

```sh
./scripts/audit-migration.sh
```

## Future Services

New services must be added under category-first paths:

```text
categories/<category-id>/<service-id>/
```

Each service keeps its own source definition, local additions, generated output, updater, scheduler, and validation. Add category safe installers under `safe-install/<category-id>/`.

Do not add CDN providers or cloud providers as services, such as Cloudflare, Akamai, Fastly, AWS, Azure, or GCP. Service-owned CDN-looking hostnames may stay only when required by official service documentation.

## Historical Migration Notes

Legacy `services/`, `groups/`, and `profiles/` implementation folders were replaced by category-first paths. New category profiles should use:

```text
categories/<category-id>/<category-id>-to-outbound/services.txt
```

Do not copy domains or CIDR ranges into groups, profiles, or category profiles. Keep real data in service database folders, then reference services by ID.

MikroTik uses generated RouterOS regex. Database files must contain normal domains only, like `domain.com`. Do not add `*.domain.com` to MikroTik database files.

Wildcard format like `*.domain.com` is only for future FortiGate output/export.

Naming and source rules:

```text
docs/NAMING.md
docs/SOURCES.md
docs/supported-services.md
docs/add-new-service.md
```

Current category profiles:

```text
categories/messaging/messaging-to-outbound
categories/social-media/social-media-to-outbound
categories/design/design-to-outbound
categories/primary/primary-to-outbound
categories/package-repositories/package-repositories-to-outbound
categories/google-services/google-services-to-outbound
categories/video-streaming/video-streaming-to-outbound
categories/ai/ai-to-outbound
categories/developer/developer-to-outbound
categories/music/music-to-outbound
categories/gaming/gaming-to-outbound
categories/mobile-app-store/mobile-app-store-to-outbound
categories/cloud-storage/cloud-storage-to-outbound
```

## MikroTik Update Safety

The updater script:

```text
1. downloads the selected `list-all.rsc`
2. checks the downloaded file exists
3. checks minimum file size
4. backs up current DNS Static records for the target address-list
5. backs up current firewall address-list records for the target address-list
6. imports the new list
7. checks imported records exist after import
8. deletes temporary downloaded and backup files
```

## Notes

- Telegram mobile app often needs CIDR rules, not only domains.
- Clients must use MikroTik DNS for DNS Static FWD rules to help.
- The root only keeps safe installers. Active migrated Telegram files live under `categories/messaging/telegram/`.

## Search Keywords

This project may help with:

- MikroTik DNS policy routing
- RouterOS DNS regex
- MikroTik address-list automation
- MikroTik split tunneling
- route selected services through VPN
- route selected services through Xray
- route selected services through WireGuard
- MikroTik service-based routing
- RouterOS firewall address-list updater
- MikroTik Telegram routing
- MikroTik GitHub routing
- MikroTik OpenAI ChatGPT routing
- MikroTik YouTube routing

## License

MIT
