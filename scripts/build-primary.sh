#!/bin/sh
set -eu

profile_root="categories/primary/primary-to-outbound"
repo_root="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
output_dir="$repo_root/$profile_root/output"
groups_file="$repo_root/$profile_root/groups.txt"
profile_list="DST-TO-OUTBOUND"
last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
tmp="$output_dir/.list-all.tmp"
trap 'rm -f "$tmp"' EXIT

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# profile=primary-to-outbound"
    echo "# List: Primary combined domains + CIDR"
    echo "# RouterOS address-list: $profile_list"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
} > "$tmp"

while read -r source_profile; do
    source_profile="$(printf '%s' "$source_profile" | tr -d '\r')"
    case "$source_profile" in
        ""|\#*) continue ;;
    esac
    profile_output="$(find "$repo_root/categories" -path "*/$source_profile/output/list-all.rsc" -type f | head -n 1)"
    if [ -z "$profile_output" ]; then
        echo "Unknown primary source profile: $source_profile" >&2
        exit 1
    fi
    source_profile_list="$(sed -n 's/^# RouterOS address-list: //p' "$profile_output" | head -n 1)"
    sed '1,/^$/d' "$profile_output" |
        sed "s/$source_profile_list/$profile_list/g" >> "$tmp"
    echo >> "$tmp"
done < "$groups_file"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated primary outbound profile output\n'
