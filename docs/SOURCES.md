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

Broad provider, ASN, and CDN ranges are allowed and may be imported automatically when they improve coverage. These ranges can intentionally include unrelated workloads hosted by the same provider. The repository still keeps domain/FQDN/regex coverage alongside those CIDRs.

## Official CIDR Feeds

When a useful machine-readable IPv4 source exists, the generator imports those CIDRs into the same service address-list. Sources may be service-specific, provider-wide, CDN-wide, or ASN-announced-prefix feeds. CIDRs complement the FQDN seed and DNS regex rules; they do not replace them.

Currently enabled official feeds:

- OpenAI ChatGPT Voice: `https://openai.com/chatgpt-voice.json` (voice server CIDRs only, not a complete ChatGPT web/API destination list)
- Telegram: `https://core.telegram.org/resources/cidr.txt`
- Microsoft 365: Microsoft 365 endpoint web service, IPv4 Optimize/Allow ranges
- Microsoft Teams: Microsoft 365 endpoint web service with `ServiceAreas=Skype`
- OneDrive: Microsoft 365 endpoint web service with `ServiceAreas=SharePoint`
- GitHub: `https://api.github.com/meta`, using the `web`, `api`, `git`, `packages`, and `pages` IPv4 groups
- AWS: `https://ip-ranges.amazonaws.com/ip-ranges.json`, all published IPv4 prefixes
- Google Cloud: `https://www.gstatic.com/ipranges/cloud.json`
- Google services (Drive, YouTube, Play): `https://www.gstatic.com/ipranges/goog.json`
- Microsoft Azure: current weekly `AzureCloud` IPv4 ranges discovered from the official Service Tags download page
- Cloudflare: `https://www.cloudflare.com/ips-v4` automatically when a service includes `cloudflare.com`
- ASN feeds: RIPEstat announced IPv4 prefixes for selected service-owned ASNs such as Valve, Meta, X/Twitter, and LinkedIn

Broad automatic feeds are enabled for AWS, Google Cloud/Google services, AzureCloud, Cloudflare dependencies, and selected service ASNs. Provider-wide and ASN-wide ranges are intentionally accepted even when they include unrelated hosted workloads.

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
