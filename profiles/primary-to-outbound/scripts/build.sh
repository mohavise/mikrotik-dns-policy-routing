#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../.." && pwd)"
output_dir="$profile_root/output"
profile_list="DST-TO-OUTBOUND"
last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
profiles_file="$profile_root/groups.txt"
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
    profile_output="$repo_root/profiles/$source_profile/output/list-all.rsc"
    source_profile_list="$(sed -n 's/^# RouterOS address-list: //p' "$profile_output" | head -n 1)"
    sed '1,/^$/d' "$profile_output" |
        sed "s/$source_profile_list/$profile_list/g" >> "$tmp"
    echo >> "$tmp"
done < "$profiles_file"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated primary outbound profile output\n'
