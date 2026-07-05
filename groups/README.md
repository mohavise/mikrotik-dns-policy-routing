# Groups

Groups are service categories.

They do not duplicate domains or CIDR ranges. They only list service IDs from `services/`.

Example:

```text
groups/social-media/services.txt -> telegram
```

Current group folders:

```text
social-media
messaging
design
video-streaming
ai
developer
music
gaming
cloud-storage
search
cdn
```

Use groups when several services should be installed or combined together.

When a group becomes a MikroTik routing target, use this address-list pattern:

```text
DST-<GROUP>-TO-<TARGET>
```

Example:

```text
DST-SOCIAL-MEDIA-TO-OUTBOUND
DST-DESIGN-TO-OUTBOUND
```
