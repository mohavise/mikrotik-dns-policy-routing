#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

printf 'managed-by=mohavise-mikrotik-dns-policy-routing\n'
printf 'project=mikrotik-dns-policy-routing\n'
printf 'job=validate-all\n'

find "$ROOT_DIR/categories" -mindepth 4 -maxdepth 4 -path '*/database/service.conf' -type f | sort |
while read -r service_conf; do
    service_root="$(dirname "$(dirname "$service_conf")")"
    name="${service_root#$ROOT_DIR/}"
    printf '\n==> validate service: %s\n' "$name"
    sh "$ROOT_DIR/scripts/validate-service.sh" "$service_root"
done

find "$ROOT_DIR/categories" -mindepth 3 -maxdepth 3 -path '*/*-to-outbound/services.txt' -type f | sort |
while read -r services_file; do
    profile_root="$(dirname "$services_file")"
    name="${profile_root#$ROOT_DIR/}"
    case "$name" in
        categories/primary/*) continue ;;
    esac
    printf '\n==> validate profile: %s\n' "$name"
    sh "$ROOT_DIR/scripts/validate-profile.sh" "$profile_root"
done

printf '\n==> validate primary profile: categories/primary/primary-to-outbound\n'
test -s "$ROOT_DIR/categories/primary/primary-to-outbound/output/list-all.rsc"
grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$ROOT_DIR/categories/primary/primary-to-outbound/output/list-all.rsc"
grep -q 'DST-TO-OUTBOUND' "$ROOT_DIR/categories/primary/primary-to-outbound/output/list-all.rsc"

printf '\n==> validate generated output safety\n'
sh "$ROOT_DIR/scripts/validate-authoritative-cleanup.sh"

printf '\n==> validate secure RouterOS fetch settings\n'
if grep -R -n --include='*.rsc' 'mode=https' "$ROOT_DIR/safe-install" "$ROOT_DIR/categories"; then
    echo 'Insecure RouterOS mode=https setting found' >&2
    exit 1
fi

printf '\n==> validate RouterOS updater control flow\n'
sh "$ROOT_DIR/scripts/validate-routeros-updaters.sh"

printf '\nValidation complete\n'
