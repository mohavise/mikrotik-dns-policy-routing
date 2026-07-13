# Add a New Service

This repository is database-first. Add real service data only under `categories/<category-id>/<service-id>/database/`, then reference the service from category profiles.

## Scope Rules

Add final-user services, app stores, communication apps, productivity apps, developer tools used directly by users, package repositories, streaming apps, payment apps, AI apps, and device ecosystem services.

Do not add broad cloud-provider, CDN-provider, hosting/VPS, or generic infrastructure lists. Public provider IP ranges and customer workload domains can route unrelated websites and applications.

A tightly scoped cloud control-plane service is allowed when it contains only official provider websites, documentation, sign-in, console, management endpoints, and explicitly required console dependencies. Document every included domain and explicitly exclude customer hosting domains and public cloud IP ranges.

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
categories/<category-id>/<service-id>/database/sources.md
```

Manual additions belong only in:

```text
categories/<category-id>/<service-id>/database/manual-domains.txt
categories/<category-id>/<service-id>/database/manual-cidr.txt
```

## Required Service Files

Create:

```text
categories/<category-id>/<service-id>/database/service.conf
categories/<category-id>/<service-id>/database/sources.md
categories/<category-id>/<service-id>/database/domains.txt
categories/<category-id>/<service-id>/database/manual-domains.txt
categories/<category-id>/<service-id>/database/manual-cidr.txt
categories/<category-id>/<service-id>/output/list-domains.rsc
categories/<category-id>/<service-id>/output/list-cidr.rsc
categories/<category-id>/<service-id>/output/list-all.rsc
categories/<category-id>/<service-id>/routeros/update.rsc
categories/<category-id>/<service-id>/routeros/scheduler.rsc
```

Category safe installers belong under:

```text
safe-install/<category-id>/<service-id>/safe-install-<service-id>-outbound.rsc
```

Do not add root `safe-install-*.rsc` files for new services. The only root installer is `safe-install-outbound.rsc` for the primary outbound profile. Do not create `safe-install/primary/`.

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

Add the service to its category profile:

```text
categories/<category-id>/<category-id>-to-outbound/services.txt
```

Then run:

```sh
./scripts/build-all.sh
./scripts/validate-all.sh
```

If the service belongs to a new category, create:

```text
categories/<category-id>/<category-id>-to-outbound/services.txt
categories/<category-id>/<category-id>-to-outbound/
safe-install/<category-id>/safe-install-<category-id>-to-outbound.rsc
```

Do not copy domains or CIDR ranges into category profiles. Category profiles should reference service IDs only.
