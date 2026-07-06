#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
cmd="rem""ove"

for file in $(find "$ROOT_DIR/categories" -path '*/output/list-*.rsc' -type f | sort); do
    list="$(awk -F': ' '/^# RouterOS address-list: / { print $2; exit }' "$file")"

    test -n "$list" || { echo "FAIL: missing RouterOS address-list header: $file" >&2; exit 1; }

    if grep -q '^/ip dns static$' "$file"; then
        dns_line="$cmd [find address-list=$list]"
        grep -Fq "$dns_line" "$file" || { echo "FAIL: missing authoritative DNS cleanup for $list in $file" >&2; exit 1; }

        cleanup_nr="$(awk -v line="$dns_line" '$0 == line { print NR; exit }' "$file")"
        first_add_nr="$(awk '/type=FWD/ { print NR; exit }' "$file")"
        if [ -n "$first_add_nr" ] && { [ -z "$cleanup_nr" ] || [ "$cleanup_nr" -gt "$first_add_nr" ]; }; then
            echo "FAIL: DNS cleanup must be before DNS add lines in $file" >&2
            exit 1
        fi
    fi

    if grep -q '^/ip firewall address-list$' "$file"; then
        addr_line="$cmd [find list=$list]"
        grep -Fq "$addr_line" "$file" || { echo "FAIL: missing authoritative address-list cleanup for $list in $file" >&2; exit 1; }

        cleanup_nr="$(awk -v line="$addr_line" '$0 == line { print NR; exit }' "$file")"
        first_add_nr="$(awk '/add list=/ { print NR; exit }' "$file")"
        if [ -n "$first_add_nr" ] && { [ -z "$cleanup_nr" ] || [ "$cleanup_nr" -gt "$first_add_nr" ]; }; then
            echo "FAIL: address-list cleanup must be before add lines in $file" >&2
            exit 1
        fi
    fi
done

for update_file in $(find "$ROOT_DIR/categories" -path '*/routeros/update.rsc' -type f | sort); do
    grep -q '/system script' "$update_file" || { echo "FAIL: missing script section in $update_file" >&2; exit 1; }
    grep -q "$cmd \\[find name=" "$update_file" || { echo "FAIL: updater is not repeat-safe: $update_file" >&2; exit 1; }
done

for scheduler_file in $(find "$ROOT_DIR/categories" -path '*/routeros/scheduler.rsc' -type f | sort); do
    grep -q '/system scheduler' "$scheduler_file" || { echo "FAIL: missing scheduler section in $scheduler_file" >&2; exit 1; }
    grep -q "$cmd \\[find name=" "$scheduler_file" || { echo "FAIL: scheduler is not repeat-safe: $scheduler_file" >&2; exit 1; }
done

printf 'Authoritative cleanup validation passed\n'
