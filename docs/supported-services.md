# Supported Services

This repository provides MikroTik RouterOS DNS policy routing lists for selected final-user services.

The goal is service-based routing: route selected destinations through an outbound path such as Xray, VPN, WireGuard, WARP, proxy, or WAN2 without routing all traffic.

## Services

| Service | Address list | Category |
| --- | --- | --- |
| Telegram | `DST-TELEGRAM-TO-OUTBOUND` | messaging, social media |
| Instagram | `DST-INSTAGRAM-TO-OUTBOUND` | social media |
| WhatsApp | `DST-WHATSAPP-TO-OUTBOUND` | messaging, social media |
| Facebook | `DST-FACEBOOK-TO-OUTBOUND` | social media |
| X/Twitter | `DST-X-TO-OUTBOUND` | social media |
| LinkedIn | `DST-LINKEDIN-TO-OUTBOUND` | social media |
| Signal | `DST-SIGNAL-TO-OUTBOUND` | messaging, social media |
| Figma | `DST-FIGMA-TO-OUTBOUND` | design |
| Canva | `DST-CANVA-TO-OUTBOUND` | design |
| GitHub | `DST-GITHUB-TO-OUTBOUND` | developer |
| OpenAI / ChatGPT | `DST-OPENAI-TO-OUTBOUND` | AI |
| Ubuntu repositories | `DST-UBUNTU-TO-OUTBOUND` | package repositories |
| Debian repositories | `DST-DEBIAN-TO-OUTBOUND` | package repositories |
| Red Hat repositories | `DST-REDHAT-TO-OUTBOUND` | package repositories |
| Proxmox repositories | `DST-PROXMOX-TO-OUTBOUND` | package repositories |
| Docker repositories | `DST-DOCKER-TO-OUTBOUND` | package repositories |
| Google Drive | `DST-GOOGLE-DRIVE-TO-OUTBOUND` | cloud storage, Google services |
| YouTube | `DST-YOUTUBE-TO-OUTBOUND` | video streaming, Google services |
| Spotify | `DST-SPOTIFY-TO-OUTBOUND` | music |
| Steam | `DST-STEAM-TO-OUTBOUND` | gaming |
| Apple App Store | `DST-APPLE-APP-STORE-TO-OUTBOUND` | mobile app store |
| Google Play | `DST-GOOGLE-PLAY-TO-OUTBOUND` | mobile app store |

## Combined Profiles

| Profile | Address list | Purpose |
| --- | --- | --- |
| AI | `DST-AI-TO-OUTBOUND` | Combined AI services |
| Developer | `DST-DEVELOPER-TO-OUTBOUND` | Combined developer services |
| Package Repositories | `DST-PACKAGE-REPOSITORIES-TO-OUTBOUND` | Combined Linux package and container repository services |
| Google Services | `DST-GOOGLE-SERVICES-TO-OUTBOUND` | Combined Google-owned services |
| Cloud Storage | `DST-CLOUD-STORAGE-TO-OUTBOUND` | Combined cloud storage services |
| Video Streaming | `DST-VIDEO-STREAMING-TO-OUTBOUND` | Combined video streaming services |
| Music | `DST-MUSIC-TO-OUTBOUND` | Combined music services |
| Gaming | `DST-GAMING-TO-OUTBOUND` | Combined gaming services |
| Mobile App Store | `DST-MOBILE-APP-STORE-TO-OUTBOUND` | Combined mobile app store services |
| Messaging | `DST-MESSAGING-TO-OUTBOUND` | Combined messaging services |
| Social Media | `DST-SOCIAL-MEDIA-TO-OUTBOUND` | Combined strict social-media services |
| Design | `DST-DESIGN-TO-OUTBOUND` | Combined design and visual collaboration services |
| Primary | `DST-TO-OUTBOUND` | Combined selected outbound destinations |

## Install Examples

Install the primary outbound profile:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-outbound.rsc" dst-path=safe-install-outbound.rsc mode=https
/import file-name=safe-install-outbound.rsc
/file remove [find name=safe-install-outbound.rsc]
```

Install only Telegram:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-telegram-outbound.rsc" dst-path=safe-install-telegram-outbound.rsc mode=https
/import file-name=safe-install-telegram-outbound.rsc
/file remove [find name=safe-install-telegram-outbound.rsc]
```
