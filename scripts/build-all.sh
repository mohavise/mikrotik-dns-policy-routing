#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

printf 'managed-by=mohavise-mikrotik-dns-policy-routing\n'
printf 'project=mikrotik-dns-policy-routing\n'
printf 'job=build-all\n'

find "$ROOT_DIR/categories" -mindepth 4 -maxdepth 4 -path '*/database/service.conf' -type f | sort |
while read -r service_conf; do
    service_root="$(dirname "$(dirname "$service_conf")")"
    name="${service_root#$ROOT_DIR/}"
    printf '\n==> build service: %s\n' "$name"
    sh "$ROOT_DIR/scripts/build-service.sh" "$service_root"
done

find "$ROOT_DIR/categories" -mindepth 3 -maxdepth 3 -path '*/*-to-outbound/services.txt' -type f | sort |
while read -r services_file; do
    profile_root="$(dirname "$services_file")"
    name="${profile_root#$ROOT_DIR/}"
    case "$name" in
        categories/primary/*) continue ;;
    esac
    printf '\n==> build profile: %s\n' "$name"
    sh "$ROOT_DIR/scripts/build-profile.sh" "$profile_root"
done

printf '\n==> build profile: categories/primary/primary-to-outbound\n'
sh "$ROOT_DIR/scripts/build-primary.sh"

printf '\n==> postprocess generated RouterOS outputs\n'
sh "$ROOT_DIR/scripts/enforce-authoritative-cleanup.sh"

printf '\n==> enforce secure RouterOS fetch settings\n'
sh "$ROOT_DIR/scripts/harden-routeros-fetch.sh"

printf '\nBuild complete\n'
