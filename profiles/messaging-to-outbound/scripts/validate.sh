#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_file="$profile_root/output/list-all.rsc"

test -s "$output_file"
grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_file"
grep -q 'DST-MESSAGING-TO-OUTBOUND' "$output_file"

for service in signal telegram whatsapp; do
    grep -q "$service:" "$output_file"
done

if [ "$(grep -c 'type=FWD' "$output_file")" -lt 20 ]; then
    echo "Too few messaging domain entries"
    exit 1
fi
