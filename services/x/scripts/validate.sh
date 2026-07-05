#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
service_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_dir="$service_root/output"

for file in list-domains.rsc list-cidr.rsc list-all.rsc; do
    test -s "$output_dir/$file"
done

grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_dir/list-all.rsc"
grep -q 'x:' "$output_dir/list-all.rsc"
grep -q 'DST-X-TO-OUTBOUND' "$output_dir/list-all.rsc"

if [ "$(grep -c 'type=FWD' "$output_dir/list-domains.rsc")" -lt 4 ]; then
    echo "Too few X domain entries"
    exit 1
fi

