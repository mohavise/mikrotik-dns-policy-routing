#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../../.." && pwd)"
output_dir="$profile_root/output"
profile_list="DST-GOOGLE-SERVICES-TO-OUTBOUND"
last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
services_file="$profile_root/services.txt"
tmp="$output_dir/.list-all.tmp"
trap 'rm -f "$tmp"' EXIT

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# profile=google-services-to-outbound"
    echo "# List: Google Services combined domains + CIDR"
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
    case "$service" in
        google-drive) service_root="$repo_root/categories/cloud-storage/google-drive" ;;
        youtube) service_root="$repo_root/categories/video-streaming/youtube" ;;
        *) echo "Unknown Google Services service: $service" >&2; exit 1 ;;
    esac
    service_conf="$service_root/database/service.conf"
    service_list="$(sed -n 's/^LIST_NAME="\([^"]*\)"/\1/p' "$service_conf")"
    sed '1,/^$/d' "$service_root/output/list-all.rsc" |
        sed "s/$service_list/$profile_list/g" >> "$tmp"
    echo >> "$tmp"
done < "$services_file"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated google services profile output\n'

