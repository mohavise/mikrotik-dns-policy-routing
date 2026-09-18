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

Database files may contain the exact service hostnames published by the source, for example `o33249.ingest.sentry.io`, `auth.openai.com`, or `chatgpt.com`. Do not add wildcard or regular-expression syntax such as `*.domain.com` to database files.

Generated RouterOS output reduces each hostname to its broad base parent domain. For each base domain it then creates a paired hybrid rule set in the same service address-list:

```routeros
/ip firewall address-list
add list=DST-SERVICE-TO-OUTBOUND address="domain.com" comment="service:seed:domain.com"

/ip dns static
add regexp="(^|.*\\.)domain\\.com$" type=FWD address-list=DST-SERVICE-TO-OUTBOUND comment="service:dns:domain.com"
```

The firewall FQDN rule seeds addresses for the main/base domain. The DNS regex learns addresses for the base domain and any subdomain that clients resolve through the MikroTik DNS resolver. For example, OpenAI dependencies such as `o33249.ingest.sentry.io` become the base domain `sentry.io`, while `auth.openai.com` becomes `openai.com`. Duplicate base domains are generated only once.

Common multi-label country suffixes such as `co.uk` and `com.au` retain the registrant label, so `broadbandspeedchecker.co.uk` remains `broadbandspeedchecker.co.uk` rather than being reduced to `co.uk`.

Do not add broad CDN or cloud-hosting provider lists, public provider IP ranges, or generic customer workload domains unless that provider domain is an actual dependency of the selected service. When a service source contains a dependency under a shared provider, the generated MikroTik list deliberately uses that provider's base parent domain so the seed and DNS regex cover the provider domain family used by that service.

## Official CIDR Feeds

When a service owner publishes a machine-readable, service-specific IPv4 feed, the generator imports those CIDRs into the same service address-list. Official CIDRs complement the FQDN seed and DNS regex rules; they do not replace them.

Currently enabled official feeds:

- OpenAI ChatGPT Voice: `https://openai.com/chatgpt-voice.json` (voice server CIDRs only, not a complete ChatGPT web/API destination list)
- Telegram: `https://core.telegram.org/resources/cidr.txt`
- Microsoft 365: Microsoft 365 endpoint web service, IPv4 Optimize/Allow ranges
- Microsoft Teams: Microsoft 365 endpoint web service with `ServiceAreas=Skype`
- OneDrive: Microsoft 365 endpoint web service with `ServiceAreas=SharePoint`
- GitHub: `https://api.github.com/meta`, using the `web`, `api`, `git`, `packages`, and `pages` IPv4 groups

Broad provider feeds are not imported automatically just because they are available. AWS provider-wide/EC2 ranges and Google-wide cloud/API ranges can cover unrelated workloads and can make the primary RouterOS payload unnecessarily large. Add them only when the service scope can be filtered narrowly enough to remain useful for policy routing.

Category and primary aggregate builds deduplicate identical effective RouterOS rules across services, so overlapping official CIDRs are emitted once in aggregate outputs.

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
