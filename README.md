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
routeros-v7/       RouterOS v7 base config
address-lists/     static IP/CIDR address-lists
domain-lists/      DNS FWD domain categories
use-cases/         real deployment examples
troubleshooting/   common problems and checks
scripts/           update/import helper scripts
```

## Quick start

Import the base config first:

```rsc
/import file-name=routeros-v7/base-config.rsc
```

Then import domain lists, for example:

```rsc
/import file-name=domain-lists/starter-domains.rsc
```

## Important notes

- Clients must use MikroTik as DNS.
- Forcing DNS to MikroTik is recommended.
- Telegram mobile app usually needs IP/CIDR rules, not only domain rules.
- Some CDNs use shared IPs, so domain-based routing is not always perfect.

## License

MIT
