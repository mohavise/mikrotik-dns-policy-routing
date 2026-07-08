#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
    echo "usage: $0 categories/<category>/<category>-to-outbound" >&2
    exit 2
fi

profile_root="$1"
category_root="$(CDPATH= cd -- "$profile_root/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../../.." && pwd)"
category_id="$(basename "$category_root")"
output_file="$profile_root/output/list-all.rsc"
services_file="$profile_root/services.txt"
profile_list="DST-$(printf '%s' "$category_id" | tr '[:lower:]' '[:upper:]')-TO-OUTBOUND"

test -s "$output_file"
grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_file"
grep -q "$profile_list" "$output_file"

min_count=0
while read -r service; do
    service="$(printf '%s' "$service" | tr -d '\r')"
    case "$service" in
        ""|\#*) continue ;;
    esac
    if [ ! -f "$category_root/$service/database/service.conf" ] &&
        ! find "$repo_root/categories" -path "*/$service/database/service.conf" -type f | grep -q .; then
        echo "Unknown profile service: $service" >&2
        exit 1
    fi
    grep -q "$service:" "$output_file"
    min_count=$((min_count + 1))
done < "$services_file"

if [ "$(grep -c 'type=FWD' "$output_file")" -lt "$min_count" ]; then
    echo "Too few $category_id profile domain entries"
    exit 1
fi
