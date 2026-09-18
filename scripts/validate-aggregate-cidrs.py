#!/usr/bin/env python3
import ipaddress
import re
import sys
from pathlib import Path

if len(sys.argv) != 2:
    raise SystemExit("usage: validate-aggregate-cidrs.py <list-all.rsc>")

path = Path(sys.argv[1])
networks = []

pattern = re.compile(
    r'^:do \{ add list=[^ ]+ address=([^ "]+) comment="[^"]+" \} on-error=\{\}$'
)

for line in path.read_text(encoding="utf-8").splitlines():
    match = pattern.match(line)
    if not match:
        continue
    value = match.group(1)
    try:
        network = ipaddress.ip_network(value, strict=False)
    except ValueError:
        continue
    if network.version == 4:
        networks.append(network)

actual = sorted(networks, key=lambda net: (int(net.network_address), net.prefixlen))
collapsed = list(ipaddress.collapse_addresses(actual))
collapsed.sort(key=lambda net: (int(net.network_address), net.prefixlen))

if actual != collapsed:
    print(f"{path}: aggregate CIDRs are not fully collapsed", file=sys.stderr)
    sys.exit(1)

if len(actual) != len(set(actual)):
    print(f"{path}: duplicate aggregate CIDRs found", file=sys.stderr)
    sys.exit(1)

print(f"{path}: {len(actual)} aggregate CIDRs are fully collapsed")
