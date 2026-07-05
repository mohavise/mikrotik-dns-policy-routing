#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../.." && pwd)"
output_dir="$profile_root/output"
profile_list="DST-TO-OUTBOUND"
source_profile_list="DST-SOCIAL-MEDIA-TO-OUTBOUND"
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
    sed '1,/^$/d' "$repo_root/profiles/social-media-to-outbound/output/list-all.rsc" |
        sed "s/$source_profile_list/$profile_list/g"
} > "$tmp"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated primary outbound profile output\n'
