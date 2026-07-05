#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
output_file="$profile_root/output/list-all.rsc"

test -s "$output_file"
grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_file"
grep -q 'DST-TO-OUTBOUND' "$output_file"

for service in canva debian docker facebook figma github google-drive instagram linkedin openai proxmox redhat signal spotify steam telegram ubuntu whatsapp x youtube; do
    grep -q "$service:" "$output_file"
done

if [ "$(grep -c 'type=FWD' "$output_file")" -lt 124 ]; then
    echo "Too few primary domain entries"
    exit 1
fi
