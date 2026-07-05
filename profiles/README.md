# Profiles

Profiles are MikroTik routing targets.

A profile decides which services and groups should be combined for a router policy.

Naming pattern:

```text
DST-<GROUP>-TO-<TARGET>
```

Example:

```text
profiles/social-media-to-outbound/groups.txt -> social-media
DST-SOCIAL-MEDIA-TO-OUTBOUND
profiles/primary-to-outbound/groups.txt -> social-media-to-outbound
DST-TO-OUTBOUND
```

The service database stays in `services/`. Profiles only choose what should be routed.
