# Naming

## MikroTik Address Lists

Use this pattern for generated MikroTik destination address-lists:

```text
DST-<GROUP>-TO-<TARGET>
```

Examples:

```text
DST-TELEGRAM-TO-OUTBOUND
DST-SOCIAL-MEDIA-TO-OUTBOUND
DST-STREAMING-TO-OUTBOUND
DST-TO-OUTBOUND
DST-MESSAGING-TO-OUTBOUND
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
DST-MICROSOFT-SERVICES-TO-OUTBOUND
DST-DESIGN-TO-OUTBOUND
DST-MUSIC-TO-OUTBOUND
DST-GAMING-TO-OUTBOUND
DST-MOBILE-APP-STORE-TO-OUTBOUND
DST-SEARCH-TO-OUTBOUND
DST-CDN-TO-OUTBOUND
```

Rules:

- use uppercase for MikroTik address-list names
- use hyphen-separated words
- use `DST` for destination lists
- use `TO` before the routing target
- keep service/group names in the middle
- keep target names route-focused, such as `OUTBOUND`, `VPN`, `WARP`, `PROXY`, or `WAN2`

## Repository IDs

Use lowercase hyphen-separated IDs:

```text
telegram
social-media
social-media-to-outbound
```

## Signature

Generated and router-facing files should include:

```text
# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
```

Service files should also include:

```text
# service=<service-id>
```

Group and profile files should include:

```text
# group=<group-id>
# profile=<profile-id>
```
