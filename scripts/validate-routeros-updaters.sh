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
    if grep -q -- '-UPDATE-BACKUP' "$updater"; then
        fail "DNS-entry staging collision risk found in $updater"
    fi
    grep -q 'legacyLastGoodFile' "$updater" || fail "missing legacy rollback-file cleanup in $updater"
    if grep -q '/file copy' "$updater"; then
        fail "persistent updater payload found in $updater"
    fi
    grep -q 'verbose=yes dry-run' "$updater" || fail "missing import syntax preflight in $updater"
    grep -q 'payloadSize' "$updater" || fail "missing file-size payload validation in $updater"
    if grep -q '/file get .* contents' "$updater"; then
        fail "contents-based payload validation blocks large files in $updater"
    fi
    grep -Fq '/file remove [find name=\$legacyLastGoodFile]' "$updater" || fail "legacy rollback file is not removed in $updater"
    grep -Fq '/file remove [find name=\$fileName]' "$updater" || fail "downloaded payload is not removed in $updater"
done

printf 'RouterOS updater control flow is valid\n'
