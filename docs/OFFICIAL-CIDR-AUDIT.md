# Official CIDR Feed Audit

This document tracks whether each service has a trustworthy, machine-readable, service-specific IPv4 source that is suitable for MikroTik destination policy routing.

The acceptance rule is intentionally strict:

- prefer a source published by the service owner;
- require destination/server ranges, not merely source/egress ranges;
- avoid provider-wide customer address space when the service cannot be isolated;
- keep domain rules when the official IP feed covers only part of a service;
- do not convert ASN ownership into a CIDR feed unless the service owner publishes or directly maintains the prefix data.

## Enabled official feeds

| Service | Official source | Scope | Status |
| --- | --- | --- | --- |
| OpenAI | https://openai.com/chatgpt-voice.json | ChatGPT Voice server IPv4 ranges; UDP 3478 scope documented by OpenAI | Enabled as supplemental CIDRs |
| GitHub | https://api.github.com/meta | GitHub `web`, `api`, `git`, `packages`, and `pages` IPv4 groups | Enabled |
| Telegram | https://core.telegram.org/resources/cidr.txt | Telegram-owned/current service CIDRs | Enabled |
| Microsoft 365 | https://endpoints.office.com/endpoints/Worldwide | Microsoft 365 IPv4 Optimize/Allow endpoint sets | Enabled |
| Microsoft Teams | https://endpoints.office.com/endpoints/Worldwide?ServiceAreas=Skype | Teams/Skype IPv4 Optimize/Allow endpoint sets | Enabled |
| OneDrive | https://endpoints.office.com/endpoints/Worldwide?ServiceAreas=SharePoint | SharePoint/OneDrive IPv4 Optimize/Allow endpoint sets | Enabled |

OpenAI's current published CIDRs are specifically for ChatGPT Voice. They supplement the OpenAI domain rules and must not be described as a complete destination IP list for all ChatGPT web/API traffic.

## Reviewed but intentionally not enabled

| Service | Official information found | Decision |
| --- | --- | --- |
| Amazon Web Services | AWS publishes https://ip-ranges.amazonaws.com/ip-ranges.json with per-service keys | Not enabled for the generic AWS service. `AMAZON`/EC2 space is very broad, some services use EC2 space, and AWS states that not every service has published ranges. |
| Google Cloud | Google publishes `cloud.json` for customer-usable Google Cloud external ranges | Not enabled for the generic Google Cloud service because these ranges include unrelated customer workloads and are not a narrow console/control-plane destination feed. |
| Microsoft Azure | Microsoft publishes Azure Service Tags and weekly JSON downloads | Not enabled for the generic Azure service. Broad AzureCloud/customer service-tag space would capture unrelated workloads. Add only if a future profile can select narrow service tags. |
| Windows Update | Microsoft guidance relies on changing FQDNs/endpoints and does not provide a stable Windows Update destination-IP feed | Keep domain-based rules. |
| Discord | Discord publishes https://cdn.discordapp.com/ipranges/discord.json | Not enabled. The official list is documented for verifying Discordbot/Discord egress requests to external sites, not as the destination IP set for Discord clients. |
| Signal | Signal publishes required domains and ports in its firewall guidance | No destination CIDR feed identified; keep domain rules. |
| Figma | Figma publishes an official network domain allowlist | No destination CIDR feed identified; keep domain rules. |
| Steam | Valve says non-web traffic is from AS32590, but its support guidance points to a third-party BGP prefix listing | Not imported under the official-source-only rule. |
| Apple App Store | Apple publishes network/domain requirements and Apple owns broad address space | Do not use broad Apple-owned ranges as App Store destination ranges. |
| Google Play | Google infrastructure ranges are broad/shared | Do not use Google-wide or Google Cloud customer ranges as a Play-specific destination list. |
| Samsung Galaxy Store | No narrow owner-published machine-readable destination CIDR feed identified | Keep domain rules. |

## No narrow official CIDR feed identified yet

The following services remain domain-driven unless a suitable owner-published service-specific feed is found:

- Canva
- Wise
- WhatsApp
- Spotify
- Debian
- Docker
- Proxmox
- Red Hat
- Ubuntu
- Facebook
- Instagram
- LinkedIn
- Reddit
- X
- YouTube
- Google Drive
- IP Detection
- Speedtest

For these services, a provider ASN, a CDN ASN, DNS observations, third-party BGP data, or a cloud-provider-wide IP list is not sufficient by itself to qualify as an official destination CIDR feed.

## Re-audit policy

Re-check this document when:

- a service publishes a new official firewall/network requirements page;
- an official JSON/TXT endpoint feed becomes available;
- a source starts exposing service labels that allow safe filtering;
- an existing feed changes semantics or ownership;
- generated aggregate payload size approaches the RouterOS safety limit.

The build must continue to validate minimum counts, sudden drops, deterministic output, aggregate deduplication, and RouterOS payload size after enabling any new CIDR source.
