# Structure Migration

This document is a historical record of the completed category-first migration.

The repository now uses `categories/` as the active source-of-truth for services and profiles. Legacy `services/`, `groups/`, and `profiles/` implementation folders were removed after migration.

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
  <category-id>-to-outbound/
    README.md
    services.txt
    output/
      list-all.rsc
    routeros/
      update.rsc
      scheduler.rsc
```

Build and validation scripts are centralized under the repository root `scripts/` directory.

Category-first safe installers use the same category layout:

```text
safe-install/<category-id>/
  README.md
  safe-install-<category-id>-to-outbound.rsc
  <service-id>/
    README.md
    safe-install-<service-id>-outbound.rsc
```

The repository root keeps only the primary installer:

```text
safe-install-outbound.rsc
```

## Legacy Paths

These folders were legacy compatibility paths during migration:

```text
services/
groups/
profiles/
```

They were removed after the category-first migration completed.

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

google-services:
  - google-drive
  - youtube

microsoft-services:
  - microsoft-365
  - onedrive
  - teams
  - windows-update

music:
  - spotify

gaming:
  - steam

mobile-app-store:
  - apple-app-store
  - google-play
  - samsung-galaxy-store
```

## Migration Rules Used

- Do not add new services under `services/`.
- Do not add new category profiles under `profiles/`.
- Do not add new category service lists under `groups/`.
- Do not change RouterOS DNS regex generation during structure migration.
- Do not change generated output logic during structure migration.
- Keep service data in exactly one active source-of-truth path after each category migration is complete.
- Migration should be copy/connect work, not rewrite work.
- Copy existing working service/profile files from legacy paths to category-first paths.
- Root scripts are the upper/orchestrator scripts.
- Category service/profile scripts are the lower/execution scripts.
- During migration, connect upper scripts to lower scripts by changing paths in `scripts/build-all.sh` and `scripts/validate-all.sh`.
- Do not redesign lower script logic unless a path reference breaks after copy.

## Skeleton-First Migration Workflow Used

Each category migration was split into two separate tasks.

### Task A: Skeleton only

Create folders and non-code placeholder files first.

Allowed in Task A:

```text
categories/<category-id>/README.md
categories/<category-id>/<service-id>/README.md
categories/<category-id>/<service-id>/database/.gitkeep
categories/<category-id>/<service-id>/output/.gitkeep
categories/<category-id>/<service-id>/routeros/.gitkeep
categories/<category-id>/<category-id>-to-outbound/README.md
categories/<category-id>/<category-id>-to-outbound/services.txt
categories/<category-id>/<category-id>-to-outbound/output/.gitkeep
categories/<category-id>/<category-id>-to-outbound/routeros/.gitkeep
safe-install/<category-id>/README.md
safe-install/<category-id>/<service-id>/README.md
```

Task A must not copy or write executable code.

Do not write or modify in Task A:

```text
scripts/build-all.sh
scripts/validate-all.sh
*/routeros/update.rsc
*/routeros/scheduler.rsc
*/output/*.rsc
safe-install/**/*.rsc
```

### Task B: Copy and connect only

Only after Task A review, copy existing working files and connect the upper scripts to the new lower paths.

Task B is not a rewrite task.

Task B should mostly do this:

```text
copy legacy service files -> category service folder
copy legacy profile files -> category profile folder
copy or adapt safe-install files -> category safe-install folder
connect scripts/build-all.sh -> centralized root builders
connect scripts/validate-all.sh -> centralized root validators
```

Allowed in Task B:

```text
categories/<category-id>/<service-id>/database/*
categories/<category-id>/<service-id>/routeros/*.rsc
categories/<category-id>/<service-id>/output/*.rsc
categories/<category-id>/<category-id>-to-outbound/routeros/*.rsc
categories/<category-id>/<category-id>-to-outbound/output/*.rsc
safe-install/<category-id>/**/*.rsc
scripts/build-all.sh
scripts/validate-all.sh
```

Task B must update root build and validate wiring only for the category being migrated.

Example centralized connection:

```sh
sh "$ROOT_DIR/scripts/build-service.sh" "$service_root"
sh "$ROOT_DIR/scripts/build-profile.sh" "$profile_root"
sh "$ROOT_DIR/scripts/validate-service.sh" "$service_root"
sh "$ROOT_DIR/scripts/validate-profile.sh" "$profile_root"
```

This two-step workflow existed so humans could confirm folder design before code was copied or connected, and so code changes stayed limited to copy/connect work.

## Migration Order Used

1. Finish and verify `mobile-app-store` as the first category-first category.
2. Migrate one existing category at a time.
3. For each category, run Task A skeleton first.
4. Review folder layout.
5. Run Task B copy/connect migration for that category.
6. Keep centralized discovery in `scripts/build-all.sh` and `scripts/validate-all.sh` compatible with the migrated category.
7. Add category-first safe installers per migrated category.
8. Keep root `safe-install-outbound.rsc` as the only root installer.
9. Remove legacy paths only after all references are tested.
