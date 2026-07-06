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
profiles/design-to-outbound/groups.txt -> design
DST-DESIGN-TO-OUTBOUND
profiles/ai-to-outbound/groups.txt -> ai
DST-AI-TO-OUTBOUND
profiles/developer-to-outbound/groups.txt -> developer
DST-DEVELOPER-TO-OUTBOUND
profiles/package-repositories-to-outbound/groups.txt -> package-repositories
DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
profiles/google-services-to-outbound/groups.txt -> google-services
DST-GOOGLE-SERVICES-TO-OUTBOUND
profiles/mobile-app-store-to-outbound/groups.txt -> mobile-app-store
DST-MOBILE-APP-STORE-TO-OUTBOUND
```

The service database stays in `services/`. Profiles only choose what should be routed.

Current and reserved profile folders:

```text
social-media-to-outbound
primary-to-outbound
messaging-to-outbound
design-to-outbound
video-streaming-to-outbound
ai-to-outbound
developer-to-outbound
package-repositories-to-outbound
google-services-to-outbound
music-to-outbound
gaming-to-outbound
mobile-app-store-to-outbound
cloud-storage-to-outbound
search-to-outbound
cdn-to-outbound
```
