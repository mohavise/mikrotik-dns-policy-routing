# Source Policy

Use the most reliable source available for each service.

Preferred source order:

1. official service owner source
2. official service owner documentation
3. official service owner GitHub repository
4. mature community-maintained list with public history
5. local manual addition with a short reason

Do not copy domains or CIDR ranges into groups, profiles, or category profiles. Real data belongs in service database folders.

For migrated services, source-of-truth data lives under:

```text
categories/<category-id>/<service-id>/database/
categories/<category-id>/<service-id>/database/sources.md
```

For legacy compatibility services, source-of-truth data may still live under:

```text
services/<service-id>/database/
services/<service-id>/database/sources.md
```

Manual additions should go into the service database folder:

```text
database/manual-domains.txt
database/manual-cidr.txt
```

Manual additions should stay empty unless the value is verified and missing from the selected upstream source.

MikroTik uses generated RouterOS regex. Database files must contain normal domains only, like `domain.com`. Do not add `*.domain.com` to MikroTik database files.

Wildcard format like `*.domain.com` is only for future FortiGate output/export.

Do not add CDN providers or cloud providers as services, such as Cloudflare, Akamai, Fastly, AWS, Azure, or GCP. Service-owned CDN-looking hostnames may stay only when required by official service documentation.

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
category services first
category profiles second
primary profile last
```

RouterOS scheduler order:

```text
04:01 services
04:06 group/profile lists
04:11 primary outbound list
```
