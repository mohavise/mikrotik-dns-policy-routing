# Source Policy

Use the most reliable source available for each service.

Preferred source order:

1. official service owner source
2. official service owner documentation
3. official service owner GitHub repository
4. mature community-maintained list with public history
5. local manual addition with a short reason

Do not copy domains or CIDR ranges into groups or profiles. Real data belongs in `services/<service>/database/`.

Each service should document its sources in:

```text
services/<service>/database/sources.md
```

Manual additions should go into:

```text
services/<service>/database/manual-domains.txt
services/<service>/database/manual-cidr.txt
```

Manual additions should stay empty unless the value is verified and missing from the selected upstream source.

## Automation Order

The GitHub workflow starts at:

```text
23:30 UTC daily
```

Root orchestration scripts:

```text
scripts/build-all.sh
scripts/validate-all.sh
```

Build order:

```text
services first
profiles second
primary profile last
```

RouterOS scheduler order:

```text
04:01 services
04:06 group/profile lists
04:11 primary outbound list
```
