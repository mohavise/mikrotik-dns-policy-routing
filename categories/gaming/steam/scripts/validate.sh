#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
service_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_dir="$service_root/output"

for file in list-domains.rsc list-cidr.rsc list-all.rsc; do
    test -s "$output_dir/$file"
done

grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_dir/list-all.rsc"
grep -q 'steam' "$output_dir/list-all.rsc"
grep -q 'DST-STEAM-TO-OUTBOUND' "$output_dir/list-all.rsc"

if [ "$(grep -c 'type=FWD' "$output_dir/list-domains.rsc")" -lt 10 ]; then
    echo "Too few Steam domain entries"
    exit 1
fi

