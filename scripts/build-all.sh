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
    # An unexpectedly smaller Azure source is quarantined: retain the previous
    # generated Azure files so other services can still receive safe updates.
    # All other failures, including Azure parsing/network errors, remain fatal.
    if sh "$ROOT_DIR/scripts/build-service.sh" "$service_root"; then
        :
    else
        status=$?
        if [ "$name" = "categories/cloud-platforms/microsoft-azure" ] && [ "$status" -eq 42 ]; then
            for output in list-domains.rsc list-cidr.rsc list-all.rsc; do
                if [ ! -s "$service_root/output/$output" ]; then
                    echo "ERROR: Cannot retain Azure last-known-good: missing $output" >&2
                    exit 1
                fi
            done
            echo "::warning title=Azure CIDR source drop::Retaining last-known-good Azure output; review Microsoft Service Tags feed and source count." >&2
            printf 'WARNING: Azure list was NOT updated because source CIDRs dropped; continuing other services.\n' >&2
        else
            echo "ERROR: Failed building $name (exit $status)" >&2
            exit "$status"
        fi
    fi
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

printf '\n==> enable large RouterOS update payloads\n'
sh "$ROOT_DIR/scripts/enable-large-routeros-payloads.sh"

printf '\n==> enforce secure RouterOS fetch settings\n'
sh "$ROOT_DIR/scripts/harden-routeros-fetch.sh"

printf '\n==> generate category and service installation guides\n'
sh "$ROOT_DIR/scripts/generate-install-readmes.sh"

printf '\nBuild complete\n'
