#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
profile_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
repo_root="$(CDPATH= cd -- "$profile_root/../../.." && pwd)"
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
    case "$source_profile" in
        ai-to-outbound) profile_output="$repo_root/categories/ai/ai-to-outbound/output/list-all.rsc" ;;
        developer-to-outbound) profile_output="$repo_root/categories/developer/developer-to-outbound/output/list-all.rsc" ;;
        design-to-outbound) profile_output="$repo_root/categories/design/design-to-outbound/output/list-all.rsc" ;;
        google-services-to-outbound) profile_output="$repo_root/categories/google-services/google-services-to-outbound/output/list-all.rsc" ;;
        gaming-to-outbound) profile_output="$repo_root/categories/gaming/gaming-to-outbound/output/list-all.rsc" ;;
        messaging-to-outbound) profile_output="$repo_root/categories/messaging/messaging-to-outbound/output/list-all.rsc" ;;
        mobile-app-store-to-outbound) profile_output="$repo_root/categories/mobile-app-store/mobile-app-store-to-outbound/output/list-all.rsc" ;;
        music-to-outbound) profile_output="$repo_root/categories/music/music-to-outbound/output/list-all.rsc" ;;
        package-repositories-to-outbound) profile_output="$repo_root/categories/package-repositories/package-repositories-to-outbound/output/list-all.rsc" ;;
        social-media-to-outbound) profile_output="$repo_root/categories/social-media/social-media-to-outbound/output/list-all.rsc" ;;
        *) echo "Unknown primary source profile: $source_profile" >&2; exit 1 ;;
    esac
    source_profile_list="$(sed -n 's/^# RouterOS address-list: //p' "$profile_output" | head -n 1)"
    sed '1,/^$/d' "$profile_output" |
        sed "s/$source_profile_list/$profile_list/g" >> "$tmp"
    echo >> "$tmp"
done < "$profiles_file"

mv "$tmp" "$output_dir/list-all.rsc"
printf 'Generated primary outbound profile output\n'
