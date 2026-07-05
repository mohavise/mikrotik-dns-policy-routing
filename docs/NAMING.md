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
DST-AI-TO-OUTBOUND
DST-SOCIAL-MEDIA-TO-OUTBOUND
DST-TO-OUTBOUND
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
