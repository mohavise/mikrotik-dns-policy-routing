# MikroTik DNS Policy Routing

Database-first RouterOS list updater for routing selected services through a custom outbound path.

First service: **Telegram**.

## Purpose

```text
Telegram domains + Telegram CIDR -> DST-TO-OUTBOUND -> mangle -> to-outbound route
```

This repository is designed like an adblock/IP-list repo with service folders:

```text
service database -> generator script -> service output -> MikroTik updater script -> scheduler
```

## Structure

```text
safe-install-*.rsc            root MikroTik entry points
services/<service>/database/  trusted sources and local additions
services/<service>/output/    generated MikroTik import files
services/<service>/routeros/  updater and scheduler scripts
services/<service>/scripts/   service generator and validation
```

The repository root only keeps safe installers as MikroTik entry points. Service-specific files live under `services/<service>/`.

## Telegram Sources

| Data | Source |
| --- | --- |
| Telegram domains | `services/telegram/database/service.conf` -> `v2fly/domain-list-community` |
| Telegram CIDR | `services/telegram/database/service.conf` -> official Telegram CIDR |

## Telegram Files

| File | Purpose |
| --- | --- |
| `safe-install-telegram-outbound.rsc` | Root installer that fetches Telegram updater + scheduler and runs once |
| `services/telegram/output/list-domains.rsc` | Telegram DNS Static FWD rules |
| `services/telegram/output/list-cidr.rsc` | Telegram CIDR address-list rules |
| `services/telegram/output/list-all.rsc` | Combined domains + CIDR import file |
| `services/telegram/routeros/update.rsc` | MikroTik update script |
| `services/telegram/routeros/scheduler.rsc` | MikroTik daily scheduler |

## RouterOS List Name

```text
DST-TO-OUTBOUND
```

## Safe Install

Run this on MikroTik:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-telegram-outbound.rsc" dst-path=safe-install-telegram-outbound.rsc mode=https
/import file-name=safe-install-telegram-outbound.rsc
/file remove [find name=safe-install-telegram-outbound.rsc]
```

## Manual Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/telegram/routeros/update.rsc" dst-path=update-telegram-outbound.rsc mode=https
/import file-name=update-telegram-outbound.rsc
/system script run update-telegram-outbound
```

## Scheduler Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/services/telegram/routeros/scheduler.rsc" dst-path=scheduler-update-telegram-outbound.rsc mode=https
/import file-name=scheduler-update-telegram-outbound.rsc
/file remove [find name=scheduler-update-telegram-outbound.rsc]
```

Default schedule:

```text
04:20:00 daily
```

## GitHub Automation

Workflow:

```text
.github/workflows/update-generated-lists.yml
```

It runs daily and can be started manually from GitHub Actions.

Update flow:

```text
Telegram source domains + Telegram official CIDR -> services/telegram/scripts/build.sh -> services/telegram/output/*.rsc -> commit if changed
```

## Future Services

New services should be added under:

```text
services/<service-id>/
```

Each service keeps its own source definition, local additions, generated output, updater, scheduler, and validation. The root should only get a `safe-install-<service>-outbound.rsc` entry point.

## MikroTik Update Safety

The updater script:

```text
1. downloads services/telegram/output/list-all.rsc
2. checks the downloaded file exists
3. checks minimum file size
4. backs up current DNS Static records for DST-TO-OUTBOUND
5. backs up current firewall address-list records for DST-TO-OUTBOUND
6. imports the new list
7. checks Telegram CIDR entries exist after import
8. deletes temporary downloaded and backup files
```

## Notes

- Telegram mobile app often needs CIDR rules, not only domains.
- Clients must use MikroTik DNS for DNS Static FWD rules to help.
- The root only keeps safe installers. Telegram files live under `services/telegram/`.

## License

MIT
