#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

find "$ROOT_DIR/categories" -path '*/output/list-*.rsc' -type f | sort | while IFS= read -r file; do
    list="$(awk -F': ' '/^# RouterOS address-list: / { print $2; exit }' "$file")"

    if [ -z "$list" ]; then
        echo "Missing RouterOS address-list header: $file" >&2
        exit 1
    fi

    tmp="$file.tmp.$$"

    awk -v list="$list" '
    BEGIN {
        section = ""
        dns_done = 0
        addr_done = 0
        cmd = "rem" "ove"
    }

    /^\/ip dns static$/ {
        section = "dns"
        print
        if (!dns_done) {
            print cmd " [find address-list=" list "]"
            dns_done = 1
        }
        next
    }

    /^\/ip firewall address-list$/ {
        section = "addr"
        print
        if (!addr_done) {
            print cmd " [find list=" list "]"
            addr_done = 1
        }
        next
    }

    section == "dns" && /^remove \[find address-list=/ { next }
    section == "addr" && /^remove \[find list=/ { next }

    { print }
    ' "$file" > "$tmp"

    mv "$tmp" "$file"
done

printf 'Authoritative cleanup enforced for generated RouterOS outputs\n'
