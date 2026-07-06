# Add a New Service

This repository is database-first. Add real service data only under `services/<service-id>/database/`, then reference the service from groups and profiles.

## Scope Rules

Add final-user services, app stores, communication apps, productivity apps, developer tools used directly by users, package repositories, streaming apps, payment apps, AI apps, and device ecosystem services.

Do not add cloud providers, CDN providers, hosting/VPS providers, or generic infrastructure providers. Broad infrastructure lists can route unrelated websites and applications.

## Source Rules

Use official vendor sources whenever possible:

- official vendor documentation
- official vendor support pages
- official developer docs
- official API endpoints or JSON feeds
- official GitHub repositories owned by the vendor

Do not use random blogs, copied firewall lists, DNS logs, unofficial databases, or third-party GitHub lists as the main source.

Document sources in:

```text
services/<service-id>/database/sources.md
```

Manual additions belong only in:

```text
services/<service-id>/database/manual-domains.txt
services/<service-id>/database/manual-cidr.txt
```

## Required Service Files

Create:

```text
services/<service-id>/database/service.conf
services/<service-id>/database/sources.md
services/<service-id>/database/domains.txt
services/<service-id>/database/manual-domains.txt
services/<service-id>/database/manual-cidr.txt
services/<service-id>/output/list-domains.rsc
services/<service-id>/output/list-cidr.rsc
services/<service-id>/output/list-all.rsc
services/<service-id>/routeros/update.rsc
services/<service-id>/routeros/scheduler.rsc
services/<service-id>/scripts/build.sh
services/<service-id>/scripts/validate.sh
```

The repository root should only get:

```text
safe-install-<service-id>-outbound.rsc
```

## Naming

Repository IDs use lowercase hyphen-separated names:

```text
apple-app-store
google-play
microsoft-365
```

MikroTik destination address-lists use:

```text
DST-<GROUP>-TO-<TARGET>
```

Service-specific list example:

```text
DST-APPLE-APP-STORE-TO-OUTBOUND
```

## Build and Validate

Add the service to:

```text
scripts/build-all.sh
scripts/validate-all.sh
```

Then run:

```sh
./services/<service-id>/scripts/build.sh
./services/<service-id>/scripts/validate.sh
./scripts/validate-all.sh
```

If the service belongs to a new group, create:

```text
groups/<group-id>/services.txt
profiles/<group-id>-to-outbound/
safe-install-<group-id>-outbound.rsc
```

Do not copy domains or CIDR ranges into groups or profiles. Groups and profiles should reference service IDs only.
