#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

fail() {
    echo "RouterOS updater validation failed: $1" >&2
    exit 1
}

if grep -ERn --include='*.rsc' ':return[[:space:]]*([;}]|$)' "$ROOT_DIR/categories" "$ROOT_DIR/safe-install" "$ROOT_DIR/safe-install-outbound.rsc"; then
    fail 'value-less :return found'
fi

if grep -ERn --include='update.rsc' 'export file=.*where' "$ROOT_DIR/categories"; then
    fail 'unsupported filtered export found'
fi

find "$ROOT_DIR/categories" -path '*/routeros/update.rsc' -type f | sort |
while read -r updater; do
    grep -q -- '-UPDATE-BACKUP' "$updater" || fail "missing staged backup in $updater"
    grep -q 'downloaded file failed validation' "$updater" || fail "missing payload validation in $updater"
    grep -q 'restoring old list' "$updater" || fail "missing rollback in $updater"
done

find "$ROOT_DIR/categories" -path '*/output/list-all.rsc' -type f | sort |
while read -r output; do
    size="$(wc -c < "$output" | tr -d ' ')"
    if [ "$size" -gt 60000 ]; then
        fail "$output is $size bytes; RouterOS payload validation supports at most 60000 bytes"
    fi
done

printf 'RouterOS updater control flow is valid\n'
