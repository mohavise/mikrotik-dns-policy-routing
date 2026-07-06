#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_file="$profile_root/output/list-all.rsc"

test -s "$output_file"
grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_file"
grep -q 'DST-DESIGN-TO-OUTBOUND' "$output_file"

for service in canva figma; do
    grep -q "$service:" "$output_file"
done

if [ "$(grep -c 'type=FWD' "$output_file")" -lt 4 ]; then
    echo "Too few design domain entries"
    exit 1
fi

