# Structure Migration

This repository is moving to a category-first structure.

The goal is to make each category folder contain everything related to that category: services, the category outbound profile, generated RouterOS output, updater scripts, scheduler scripts, and local documentation.

No service folders should be deleted during the early migration. Existing root `safe-install-*.rsc` files must remain available until compatibility wrappers or a final migration decision exists.

## Final Target Structure

```text
categories/<category-id>/
  README.md
  <service-id>/
    README.md
    database/
      service.conf
      sources.md
      domains.txt
      manual-domains.txt
      manual-cidr.txt
    output/
      list-domains.rsc
      list-cidr.rsc
      list-all.rsc
    routeros/
      update.rsc
      scheduler.rsc
    scripts/
      build.sh
      validate.sh
  <category-id>-to-outbound/
    README.md
    services.txt
    output/
      list-all.rsc
    routeros/
      update.rsc
      scheduler.rsc
    scripts/
      build.sh
      validate.sh
```

Category-first safe installers use the same category layout:

```text
safe-install/<category-id>/
  README.md
  safe-install-<category-id>-to-outbound.rsc
  <service-id>/
    README.md
    safe-install-<service-id>-outbound.rsc
```

## Legacy Paths

These folders are legacy compatibility paths during migration:

```text
services/
groups/
profiles/
```

Do not add new services under legacy paths. Existing services may remain there until their category is migrated.

Do not remove old root safe installers yet:

```text
safe-install-*.rsc
```

They may later become compatibility wrappers that fetch the new category-first installer paths.

## Service To Category Migration Map

```yaml
messaging:
  - telegram
  - whatsapp
  - signal

social-media:
  - instagram
  - facebook
  - x
  - linkedin

design:
  - figma
  - canva

ai:
  - openai

developer:
  - github

package-repositories:
  - ubuntu
  - debian
  - redhat
  - proxmox
  - docker

cloud-storage:
  - google-drive

video-streaming:
  - youtube

music:
  - spotify

gaming:
  - steam

mobile-app-store:
  - apple-app-store
  - google-play
  - samsung-galaxy-store
```

## Migration Rules

- Do not add new services under `services/`.
- Do not add new category profiles under `profiles/`.
- Do not add new category service lists under `groups/`.
- Do not delete legacy folders until the affected category is fully migrated and tested.
- Do not change RouterOS DNS regex generation during structure migration.
- Do not change generated output logic during structure migration.
- Keep service data in exactly one active source-of-truth path after each category migration is complete.

## Recommended Migration Order

1. Finish and verify `mobile-app-store` as the first category-first category.
2. Migrate one existing category at a time.
3. Update `scripts/build-all.sh` and `scripts/validate-all.sh` per migrated category.
4. Add category-first safe installers per migrated category.
5. Keep old root safe installers until compatibility behavior is decided.
6. Remove or archive legacy paths only after all references are tested.
