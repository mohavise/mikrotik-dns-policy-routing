#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
service_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_dir="$service_root/output"

for file in list-domains.rsc list-cidr.rsc list-all.rsc; do
    file="$output_dir/$file"
    test -s "$file"
done

grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_dir/list-all.rsc"
grep -q 'telegram' "$output_dir/list-all.rsc"
grep -q 'DST-TO-OUTBOUND' "$output_dir/list-all.rsc"

# Minimum sanity checks
if [ "$(grep -c 'type=FWD' "$output_dir/list-domains.rsc")" -lt 3 ]; then
    echo "Too few Telegram domain entries"
    exit 1
fi

if [ "$(grep -c 'add list=DST-TO-OUTBOUND address=' "$output_dir/list-cidr.rsc")" -lt 3 ]; then
    echo "Too few Telegram CIDR entries"
    exit 1
fi
