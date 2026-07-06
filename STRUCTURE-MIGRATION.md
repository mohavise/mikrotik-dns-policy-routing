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

## Skeleton-First Migration Workflow

Each category migration must be split into two separate tasks.

### Task A: Skeleton only

Create folders and non-code placeholder files first.

Allowed in Task A:

```text
categories/<category-id>/README.md
categories/<category-id>/<service-id>/README.md
categories/<category-id>/<service-id>/database/.gitkeep
categories/<category-id>/<service-id>/output/.gitkeep
categories/<category-id>/<service-id>/routeros/.gitkeep
categories/<category-id>/<service-id>/scripts/.gitkeep
categories/<category-id>/<category-id>-to-outbound/README.md
categories/<category-id>/<category-id>-to-outbound/services.txt
categories/<category-id>/<category-id>-to-outbound/output/.gitkeep
categories/<category-id>/<category-id>-to-outbound/routeros/.gitkeep
categories/<category-id>/<category-id>-to-outbound/scripts/.gitkeep
safe-install/<category-id>/README.md
safe-install/<category-id>/<service-id>/README.md
```

Task A must not copy or write executable code.

Do not write or modify in Task A:

```text
scripts/build-all.sh
scripts/validate-all.sh
*/scripts/build.sh
*/scripts/validate.sh
*/routeros/update.rsc
*/routeros/scheduler.rsc
*/output/*.rsc
safe-install/**/*.rsc
```

### Task B: Code and migration logic

Only after Task A is reviewed, Codex may copy or write code files.

Allowed in Task B:

```text
categories/<category-id>/<service-id>/database/*
categories/<category-id>/<service-id>/routeros/*.rsc
categories/<category-id>/<service-id>/scripts/*.sh
categories/<category-id>/<service-id>/output/*.rsc
categories/<category-id>/<category-id>-to-outbound/routeros/*.rsc
categories/<category-id>/<category-id>-to-outbound/scripts/*.sh
categories/<category-id>/<category-id>-to-outbound/output/*.rsc
safe-install/<category-id>/**/*.rsc
scripts/build-all.sh
scripts/validate-all.sh
```

Task B must update root build and validate scripts only for the category being migrated.

This two-step workflow exists so humans can confirm folder design before Codex writes or moves code.

## Recommended Migration Order

1. Finish and verify `mobile-app-store` as the first category-first category.
2. Migrate one existing category at a time.
3. For each category, run Task A skeleton first.
4. Review folder layout.
5. Run Task B code migration for that category.
6. Update `scripts/build-all.sh` and `scripts/validate-all.sh` per migrated category.
7. Add category-first safe installers per migrated category.
8. Keep old root safe installers until compatibility behavior is decided.
9. Remove or archive legacy paths only after all references are tested.
