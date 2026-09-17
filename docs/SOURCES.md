# Source Policy

Use the most reliable source available for each service.

Preferred source order:

1. official service owner source
2. official service owner documentation
3. official service owner GitHub repository
4. mature community-maintained list with public history
5. local manual addition with a short reason

Do not copy domains or CIDR ranges into groups, profiles, or category profiles. Real data belongs in service database folders.

Source-of-truth data lives under:

```text
categories/<category-id>/<service-id>/database/
categories/<category-id>/<service-id>/database/sources.md
```

Manual additions should go into the service database folder:

```text
database/manual-domains.txt
database/manual-cidr.txt
```

Manual additions should stay empty unless the value is verified and missing from the selected upstream source.

Database files may contain the exact service hostnames published by the source, for example `o33249.ingest.sentry.io`, `auth.openai.com`, or `chatgpt.com`. Do not add `*.domain.com` to MikroTik database files.

Generated RouterOS DNS output intentionally reduces each hostname to its broad base parent domain and uses the plain `name=` field with `type=FWD`, `match-subdomain=yes`, and the service `address-list`. For example, OpenAI dependencies such as `o33249.ingest.sentry.io` become `sentry.io`, while `auth.openai.com` becomes `openai.com`. Duplicate base domains are generated only once.

Common multi-label country suffixes such as `co.uk` and `com.au` retain the registrant label, so `broadbandspeedchecker.co.uk` remains `broadbandspeedchecker.co.uk` rather than being reduced to `co.uk`.

Wildcard format like `*.domain.com` is only for future FortiGate output/export.

Do not add broad CDN or cloud-hosting provider lists, public provider IP ranges, or generic customer workload domains unless that provider domain is an actual dependency of the selected service. When a service source contains a dependency under a shared provider, the generated MikroTik list deliberately uses that provider's base parent domain so all of its subdomains are covered by `match-subdomain=yes`.

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
