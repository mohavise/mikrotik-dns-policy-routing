#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../.." && pwd)"
output_dir="$profile_root/output"
profile_list="DST-DEVELOPER-TO-OUTBOUND"
last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
services_file="$repo_root/groups/developer/services.txt"
tmp="$output_dir/.list-all.tmp"
trap 'rm -f "$tmp"' EXIT

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# profile=developer-to-outbound"
    echo "# List: Developer combined domains + CIDR"
    echo "# RouterOS address-list: $profile_list"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
} > "$tmp"

while read -r service; do
    service="$(printf '%s' "$service" | tr -d '\r')"
    case "$service" in
        ""|\#*) continue ;;
    esac
    service_conf="$repo_root/services/$service/database/service.conf"
    service_list="$(sed -n 's/^LIST_NAME="\([^"]*\)"/\1/p' "$service_conf")"
    sed '1,/^$/d' "$repo_root/services/$service/output/list-all.rsc" |
        sed "s/$service_list/$profile_list/g" >> "$tmp"
    echo >> "$tmp"
done < "$services_file"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated developer profile output\n'

