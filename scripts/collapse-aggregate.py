#!/usr/bin/env python3
import ipaddress
import re
import sys
from pathlib import Path

if len(sys.argv) != 5:
    raise SystemExit("usage: collapse-aggregate.py <input> <output> <list-name> <profile-id>")

input_path = Path(sys.argv[1])
output_path = Path(sys.argv[2])
list_name = sys.argv[3]
profile_id = sys.argv[4]

lines = input_path.read_text(encoding="utf-8").splitlines()

header = []
for line in lines:
    if line == "":
        break
    header.append(line)

seed_re = re.compile(
    r'^:do \{ add list=' + re.escape(list_name) +
    r' address="([^"]+)" comment="([^"]+)" \} on-error=\{\}$'
)
cidr_re = re.compile(
    r'^:do \{ add list=' + re.escape(list_name) +
    r' address=([^ ]+) comment="([^"]+)" \} on-error=\{\}$'
)
regex_re = re.compile(
    r'^:do \{ add regexp="([^"]+)" type=FWD address-list=' +
    re.escape(list_name) +
    r' comment="([^"]+)" \} on-error=\{\}$'
)

seeds = {}
regexes = {}
networks = []

for line in lines:
    match = seed_re.match(line)
    if match:
        domain, comment = match.groups()
        seeds.setdefault(domain, comment)
        continue

    match = cidr_re.match(line)
    if match:
        value, _comment = match.groups()
        try:
            network = ipaddress.ip_network(value, strict=False)
        except ValueError:
            continue
        if network.version == 4:
            networks.append(network)
        continue

    match = regex_re.match(line)
    if match:
        regexp, comment = match.groups()
        regexes.setdefault(regexp, comment)

collapsed = list(ipaddress.collapse_addresses(networks))
collapsed.sort(key=lambda net: (int(net.network_address), net.prefixlen))

with output_path.open("w", encoding="utf-8") as handle:
    for line in header:
        handle.write(line + "\n")
    handle.write("\n")

    handle.write("/ip firewall address-list\n")
    handle.write(f'remove [find list={list_name} comment~":seed:"]\n')
    handle.write(f'remove [find list={list_name} comment~"cidr$"]\n')
    for domain in sorted(seeds):
        comment = seeds[domain]
        handle.write(
            f':do {{ add list={list_name} address="{domain}" comment="{comment}" }} on-error={{}}\n'
        )
    for network in collapsed:
        handle.write(
            f':do {{ add list={list_name} address={network} comment="{profile_id}-cidr" }} on-error={{}}\n'
        )

    handle.write("\n/ip dns static\n")
    handle.write(f"remove [find address-list={list_name}]\n")
    for regexp in sorted(regexes):
        comment = regexes[regexp]
        handle.write(
            f':do {{ add regexp="{regexp}" type=FWD address-list={list_name} comment="{comment}" }} on-error={{}}\n'
        )

print(
    f"Collapsed aggregate {profile_id}: "
    f"{len(networks)} source CIDR rules -> {len(collapsed)} exact CIDRs"
)
