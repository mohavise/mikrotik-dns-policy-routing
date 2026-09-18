# CIDR Feed Audit

This document tracks automatic IPv4 sources used for MikroTik destination policy routing.

Current policy intentionally allows broad provider, cloud, CDN, and ASN-announced ranges. A feed does not need to be service-exclusive. Domain/FQDN/regex rules remain alongside CIDRs.

## Enabled automatic feeds

| Service | Source | Scope |
| --- | --- | --- |
| OpenAI | https://openai.com/chatgpt-voice.json | Official ChatGPT Voice server ranges |
| GitHub | https://api.github.com/meta | Official GitHub web/api/git/packages/pages ranges |
| Telegram | https://core.telegram.org/resources/cidr.txt | Official Telegram CIDRs |
| Microsoft 365 | Microsoft endpoint web service | Optimize/Allow IPv4 |
| Teams | Microsoft endpoint web service | Skype/Teams IPv4 |
| OneDrive | Microsoft endpoint web service | SharePoint/OneDrive IPv4 |
| AWS | https://ip-ranges.amazonaws.com/ip-ranges.json | All published AWS IPv4 prefixes |
| Google Cloud | https://www.gstatic.com/ipranges/cloud.json | Broad Google Cloud IPv4 ranges |
| Google Drive | https://www.gstatic.com/ipranges/goog.json | Broad Google IPv4 ranges |
| YouTube | https://www.gstatic.com/ipranges/goog.json | Broad Google IPv4 ranges |
| Google Play | https://www.gstatic.com/ipranges/goog.json | Broad Google IPv4 ranges |
| Microsoft Azure | Official Azure Service Tags download page | Current AzureCloud IPv4 ranges |
| OpenAI / Speedtest and any service containing cloudflare.com | https://www.cloudflare.com/ips-v4 | Cloudflare-wide IPv4 ranges |
| Steam | RIPEstat AS32590 | Valve announced IPv4 prefixes |
| Facebook | RIPEstat AS32934 | Meta announced IPv4 prefixes |
| Instagram | RIPEstat AS32934 | Meta announced IPv4 prefixes |
| WhatsApp | RIPEstat AS32934 | Meta announced IPv4 prefixes |
| X | RIPEstat AS13414 | X/Twitter announced IPv4 prefixes |
| LinkedIn | RIPEstat AS14413 | LinkedIn announced IPv4 prefixes |

## Operational behavior

The scheduled build downloads the current feeds, normalizes IPv4 CIDRs, deduplicates overlaps at the generated rule level, validates sudden drops, regenerates category/primary aggregates, and pushes changed generated files.

Large aggregate lists are supported by RouterOS updaters using downloaded file-size validation plus `/import ... dry-run`, instead of reading the complete file into the RouterOS `contents` string property.

Broad feeds are intentional. They can capture unrelated customer workloads or other services sharing AWS, Google, Azure, Cloudflare, or the same ASN.

## Still domain-driven

Services without a configured broad provider/ASN/CDN source remain domain-driven until a useful source or provider mapping is added.

