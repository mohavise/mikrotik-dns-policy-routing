#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
    echo "usage: $0 categories/<category>/<category>-to-outbound" >&2
    exit 2
fi

profile_root="$1"
category_root="$(CDPATH= cd -- "$profile_root/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../../.." && pwd)"
profile_id="$(basename "$profile_root")"
category_id="$(basename "$category_root")"
output_dir="$profile_root/output"
services_file="$profile_root/services.txt"
profile_name="$(printf '%s' "$category_id" | tr '-' ' ')"
profile_list="DST-$(printf '%s' "$category_id" | tr '[:lower:]' '[:upper:]')-TO-OUTBOUND"
last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
tmp="$output_dir/.list-all.tmp"
trap 'rm -f "$tmp"' EXIT

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# profile=$profile_id"
    echo "# List: $profile_name combined domains + CIDR"
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
    service_root="$category_root/$service"
    if [ ! -f "$service_root/database/service.conf" ]; then
        service_root="$(find "$repo_root/categories" -path "*/$service/database/service.conf" -type f | sed 's#/database/service.conf$##' | head -n 1)"
    fi
    if [ -z "$service_root" ] || [ ! -f "$service_root/database/service.conf" ]; then
        echo "Unknown profile service: $service" >&2
        exit 1
    fi
    service_conf="$service_root/database/service.conf"
    service_list="$(sed -n 's/^LIST_NAME="\([^"]*\)"/\1/p' "$service_conf")"
    sed '1,/^$/d' "$service_root/output/list-all.rsc" |
        sed "s/$service_list/$profile_list/g" >> "$tmp"
    echo >> "$tmp"
done < "$services_file"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated %s profile output\n' "$category_id"
