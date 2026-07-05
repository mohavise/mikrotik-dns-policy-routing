# MikroTik DNS Policy Routing

Database-first RouterOS list updater for routing selected services through a custom outbound path.

First service family: **Meta social services**.

## Purpose

```text
service domains + optional CIDR -> DST-<GROUP>-TO-<TARGET> -> mangle -> route target
```

This repository is designed like an adblock/IP-list repo with service folders:

```text
service database -> generator script -> service output -> MikroTik updater script -> scheduler
```

The future routing model has three layers:

```text
services -> groups -> profiles
```

```text
Service = what the destination is
Group   = what category it belongs to
Profile = where MikroTik should route it
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

## Structure

```text
safe-install-*.rsc            root MikroTik entry points
docs/                         naming and source rules
services/<service>/database/  trusted sources and local additions
services/<service>/output/    generated MikroTik import files
services/<service>/routeros/  updater and scheduler scripts
services/<service>/scripts/   service generator and validation
groups/<group>/services.txt   service categories
profiles/<profile>/           MikroTik routing targets
scripts/build-all.sh          root build orchestrator
scripts/validate-all.sh       root validation orchestrator
```

The repository root only keeps safe installers as MikroTik entry points. Service-specific files live under `services/<service>/`.
RouterOS updater and scheduler imports are repeat-safe: they remove the existing script or scheduler with the same name before adding the current version.

## Current Services

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
| AI profile | `DST-AI-TO-OUTBOUND` | Combined AI services |
| Developer profile | `DST-DEVELOPER-TO-OUTBOUND` | Combined developer services |
| Package Repositories profile | `DST-PACKAGE-REPOSITORIES-TO-OUTBOUND` | Combined Linux package and container repository services |
| Google Services profile | `DST-GOOGLE-SERVICES-TO-OUTBOUND` | Combined Google-owned services |
| Cloud Storage profile | `DST-CLOUD-STORAGE-TO-OUTBOUND` | Combined cloud storage services |
| Video Streaming profile | `DST-VIDEO-STREAMING-TO-OUTBOUND` | Combined video streaming services |
| Music profile | `DST-MUSIC-TO-OUTBOUND` | Combined music services |
| Gaming profile | `DST-GAMING-TO-OUTBOUND` | Combined gaming services |
| Messaging profile | `DST-MESSAGING-TO-OUTBOUND` | Combined messaging services |
| Social Media profile | `DST-SOCIAL-MEDIA-TO-OUTBOUND` | Combined strict social-media services |
| Design profile | `DST-DESIGN-TO-OUTBOUND` | Combined design and visual collaboration services |
| Primary profile | `DST-TO-OUTBOUND` | Combined selected outbound destinations |

## Telegram Files

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
| `safe-install-ai-outbound.rsc` | Root installer that fetches the combined AI updater + scheduler and runs once |
| `safe-install-developer-outbound.rsc` | Root installer that fetches the combined developer updater + scheduler and runs once |
| `safe-install-package-repositories-outbound.rsc` | Root installer that fetches the combined package repositories updater + scheduler and runs once |
| `safe-install-google-services-outbound.rsc` | Root installer that fetches the combined Google services updater + scheduler and runs once |
| `safe-install-cloud-storage-outbound.rsc` | Root installer that fetches the combined cloud storage updater + scheduler and runs once |
| `safe-install-video-streaming-outbound.rsc` | Root installer that fetches the combined video streaming updater + scheduler and runs once |
| `safe-install-music-outbound.rsc` | Root installer that fetches the combined music updater + scheduler and runs once |
| `safe-install-gaming-outbound.rsc` | Root installer that fetches the combined gaming updater + scheduler and runs once |
| `safe-install-messaging-outbound.rsc` | Root installer that fetches the combined messaging updater + scheduler and runs once |
| `safe-install-social-media-outbound.rsc` | Root installer that fetches the combined social-media updater + scheduler and runs once |
| `safe-install-design-outbound.rsc` | Root installer that fetches the combined design updater + scheduler and runs once |
| `safe-install-outbound.rsc` | Root installer that fetches the primary outbound updater + scheduler and runs once |
| `services/telegram/output/list-domains.rsc` | Telegram DNS Static FWD rules |
| `services/telegram/output/list-cidr.rsc` | Telegram CIDR address-list rules |
| `services/telegram/output/list-all.rsc` | Combined domains + CIDR import file |
| `services/telegram/routeros/update.rsc` | MikroTik update script |
| `services/telegram/routeros/scheduler.rsc` | MikroTik daily scheduler |

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
DST-AI-TO-OUTBOUND
DST-DEVELOPER-TO-OUTBOUND
DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
DST-GOOGLE-SERVICES-TO-OUTBOUND
DST-CLOUD-STORAGE-TO-OUTBOUND
DST-VIDEO-STREAMING-TO-OUTBOUND
DST-MUSIC-TO-OUTBOUND
DST-GAMING-TO-OUTBOUND
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

Other Meta service installers:

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
safe-install-ai-outbound.rsc
safe-install-developer-outbound.rsc
safe-install-package-repositories-outbound.rsc
safe-install-google-services-outbound.rsc
safe-install-cloud-storage-outbound.rsc
safe-install-video-streaming-outbound.rsc
safe-install-music-outbound.rsc
safe-install-gaming-outbound.rsc
safe-install-messaging-outbound.rsc
safe-install-social-media-outbound.rsc
safe-install-design-outbound.rsc
safe-install-outbound.rsc
```

## Manual Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/telegram/routeros/update.rsc" dst-path=update-telegram-outbound.rsc mode=https
/import file-name=update-telegram-outbound.rsc
/system script run update-telegram-outbound
```

## Scheduler Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/telegram/routeros/scheduler.rsc" dst-path=scheduler-update-telegram-outbound.rsc mode=https
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

## Future Services

New services should be added under:

```text
services/<service-id>/
```

Each service keeps its own source definition, local additions, generated output, updater, scheduler, and validation. The root should only get a `safe-install-<service>-outbound.rsc` entry point.

## Groups And Profiles

Groups collect services by category:

```text
groups/social-media/services.txt
groups/messaging/services.txt
groups/design/services.txt
groups/ai/services.txt
groups/developer/services.txt
groups/package-repositories/services.txt
groups/google-services/services.txt
groups/video-streaming/services.txt
groups/music/services.txt
groups/gaming/services.txt
groups/cloud-storage/services.txt
groups/search/services.txt
groups/cdn/services.txt
```

Profiles decide what should be routed to a MikroTik target:

```text
profiles/social-media-to-outbound/groups.txt
profiles/social-media-to-outbound/services.txt
profiles/design-to-outbound/groups.txt
profiles/design-to-outbound/services.txt
profiles/ai-to-outbound/groups.txt
profiles/ai-to-outbound/services.txt
profiles/developer-to-outbound/groups.txt
profiles/developer-to-outbound/services.txt
profiles/package-repositories-to-outbound/groups.txt
profiles/package-repositories-to-outbound/services.txt
profiles/google-services-to-outbound/groups.txt
profiles/google-services-to-outbound/services.txt
profiles/cloud-storage-to-outbound/groups.txt
profiles/cloud-storage-to-outbound/services.txt
profiles/video-streaming-to-outbound/groups.txt
profiles/video-streaming-to-outbound/services.txt
profiles/primary-to-outbound/groups.txt
profiles/primary-to-outbound/services.txt
```

Current model:

```text
services/telegram
services/instagram
services/whatsapp
services/facebook
services/x
services/linkedin
services/signal
services/figma
services/canva
services/github
services/openai
services/ubuntu
services/debian
services/redhat
services/proxmox
services/docker
services/google-drive
services/youtube
services/spotify
services/steam
  -> groups/messaging
  -> groups/social-media
  -> groups/design
  -> groups/ai
  -> groups/developer
  -> groups/package-repositories
  -> groups/google-services
  -> groups/cloud-storage
  -> groups/video-streaming
  -> groups/music
  -> groups/gaming
  -> profiles/messaging-to-outbound
  -> profiles/social-media-to-outbound
  -> profiles/design-to-outbound
  -> profiles/ai-to-outbound
  -> profiles/developer-to-outbound
  -> profiles/package-repositories-to-outbound
  -> profiles/google-services-to-outbound
  -> profiles/cloud-storage-to-outbound
  -> profiles/video-streaming-to-outbound
  -> profiles/music-to-outbound
  -> profiles/gaming-to-outbound
  -> profiles/primary-to-outbound
```

Do not copy domains or CIDR ranges into groups or profiles. Keep real data in service folders, then reference services by ID.

Naming and source rules:

```text
docs/NAMING.md
docs/SOURCES.md
```

Current and reserved profiles:

```text
profiles/messaging-to-outbound
profiles/social-media-to-outbound
profiles/design-to-outbound
profiles/primary-to-outbound
profiles/package-repositories-to-outbound
profiles/google-services-to-outbound
profiles/video-streaming-to-outbound
profiles/ai-to-outbound
profiles/developer-to-outbound
profiles/music-to-outbound
profiles/gaming-to-outbound
profiles/cloud-storage-to-outbound
profiles/search-to-outbound
profiles/cdn-to-outbound
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
- The root only keeps safe installers. Telegram files live under `services/telegram/`.

## License

MIT
