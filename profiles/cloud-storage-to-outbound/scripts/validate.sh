#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_file="$profile_root/output/list-all.rsc"

test -s "$output_file"
grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_file"
grep -q 'DST-CLOUD-STORAGE-TO-OUTBOUND' "$output_file"
grep -q 'google-drive:' "$output_file"

if [ "$(grep -c 'type=FWD' "$output_file")" -lt 8 ]; then
    echo "Too few cloud storage domain entries"
    exit 1
fi

