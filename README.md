# MikroTik DNS Policy Routing

Compact RouterOS list updater for routing selected destinations through a custom outbound path.

First target: **Telegram**.

## Purpose

```text
Telegram domains + Telegram CIDR -> DST-TO-OUTBOUND -> mangle -> to-outbound route
```

This repository is designed like an adblock/IP-list repo:

```text
reliable source -> generator script -> root .rsc files -> MikroTik updater script -> scheduler
```

## Reliable sources

| Data | Source |
| --- | --- |
| Telegram domains | `https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/telegram` |
| Telegram CIDR | `https://core.telegram.org/resources/cidr.txt` |

## Root files

| File | Purpose |
| --- | --- |
| `list-telegram-domains.rsc` | Telegram DNS Static FWD rules |
| `list-telegram-cidr.rsc` | Telegram CIDR address-list rules |
| `list-telegram-all.rsc` | Combined domains + CIDR import file |
| `update-telegram-outbound.rsc` | MikroTik update script |
| `scheduler-update-telegram-outbound.rsc` | MikroTik daily scheduler |
| `safe-install-telegram-outbound.rsc` | Fetch updater + scheduler and run once |

## RouterOS list name

```text
DST-TO-OUTBOUND
```

## Safe install

Run this on MikroTik:

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install-telegram-outbound.rsc" dst-path=safe-install-telegram-outbound.rsc mode=https
/import file-name=safe-install-telegram-outbound.rsc
/file remove [find name=safe-install-telegram-outbound.rsc]
```

## Manual install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/update-telegram-outbound.rsc" dst-path=update-telegram-outbound.rsc mode=https
/import file-name=update-telegram-outbound.rsc
/system script run update-telegram-outbound
```

## Scheduler install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/scheduler-update-telegram-outbound.rsc" dst-path=scheduler-update-telegram-outbound.rsc mode=https
/import file-name=scheduler-update-telegram-outbound.rsc
/file remove [find name=scheduler-update-telegram-outbound.rsc]
```

Default schedule:

```text
04:20:00 daily
```

## GitHub automation

Workflow:

```text
.github/workflows/update-generated-lists.yml
```

It runs daily and can be started manually from GitHub Actions.

Update flow:

```text
Telegram source domains + Telegram official CIDR -> scripts/build.sh -> list-telegram-*.rsc -> commit if changed
```

## MikroTik update safety

The updater script:

```text
1. downloads list-telegram-all.rsc
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
- The final client-facing import files are intentionally kept in the repository root.

## License

MIT
