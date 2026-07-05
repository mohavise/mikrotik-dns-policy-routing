#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../.." && pwd)"
output_dir="$profile_root/output"
profile_list="DST-SOCIAL-MEDIA-TO-OUTBOUND"
last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"

group_dir="$repo_root/groups/social-media"
tmp="$output_dir/.list-all.tmp"
services_tmp="$output_dir/.services.tmp"
trap 'rm -f "$tmp" "$services_tmp"' EXIT

collect_group_services() {
    local group_id="$1"
    local group_path="$repo_root/groups/$group_id"
    local nested_group
    local service

    if [ -f "$group_path/groups.txt" ]; then
        while read -r nested_group; do
            nested_group="$(printf '%s' "$nested_group" | tr -d '\r')"
            case "$nested_group" in
                ""|\#*) continue ;;
            esac
            collect_group_services "$nested_group"
        done < "$group_path/groups.txt"
    fi

    if [ -f "$group_path/services.txt" ]; then
        while read -r service; do
            service="$(printf '%s' "$service" | tr -d '\r')"
            case "$service" in
                ""|\#*) continue ;;
            esac
            echo "$service"
        done < "$group_path/services.txt"
    fi
}

collect_group_services social-media | sort -u > "$services_tmp"

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# profile=social-media-to-outbound"
    echo "# List: Social Media combined domains + CIDR"
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
done < "$services_tmp"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated social media profile output\n'
