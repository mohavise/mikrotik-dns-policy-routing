# MikroTik DNS Policy Routing

Route selected domains and IP ranges through a custom outbound path on MikroTik RouterOS v7.

The outbound path can be:

- XRAY on AWS
- WireGuard gateway
- VPN tunnel
- second WAN/uplink
- any custom next-hop

## Core idea

```text
Domain -> MikroTik DNS -> dynamic address-list -> mangle -> routing table -> outbound gateway
```

MikroTik routing works by destination IP. This project uses DNS Static FWD records to collect resolved destination IPs into firewall address-lists, then routes those destinations with mangle and routing tables.

## Naming standard

```text
DST-TO-OUTBOUND   destination IPs/domains that must go to custom outbound
BYPASS-OUTBOUND   destinations that must not use custom outbound
SRC-TO-OUTBOUND   clients allowed to use custom outbound
to-outbound       routing table / routing mark
```

## Repository structure

```text
sources/           human-editable source lists
sources/domains/   one domain per line
sources/cidr/      one CIDR per line
generated/         auto-generated RouterOS .rsc files
routeros-v7/       RouterOS v7 base config
address-lists/     manual/static IP/CIDR examples
domain-lists/      manual DNS FWD examples
use-cases/         real deployment examples
troubleshooting/   common problems and checks
scripts/           build and validation scripts
.github/workflows/ GitHub Actions automation
```

## Generated files

```text
generated/dst-to-outbound-domains.rsc
generated/dst-to-outbound-cidr.rsc
generated/dst-to-outbound-all.rsc
```

Edit files inside `sources/`, not `generated/`.

## Automatic GitHub update

The workflow runs daily and can also be started manually from GitHub Actions:

```text
.github/workflows/update-generated-lists.yml
```

Flow:

```text
sources/ -> scripts/validate.sh -> scripts/build.sh -> generated/*.rsc -> commit if changed
```

## Quick start

Import the base config first:

```rsc
/import file-name=routeros-v7/base-config.rsc
```

Then import the generated list:

```rsc
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/generated/dst-to-outbound-all.rsc" dst-path=dst-to-outbound-all.rsc mode=https
/import file-name=dst-to-outbound-all.rsc
```

## Important notes

- Clients must use MikroTik as DNS.
- Forcing DNS to MikroTik is recommended.
- Telegram mobile app usually needs IP/CIDR rules, not only domain rules.
- Some CDNs use shared IPs, so domain-based routing is not always perfect.

## License

MIT
