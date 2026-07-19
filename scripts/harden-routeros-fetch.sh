#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

find "$ROOT_DIR/safe-install" "$ROOT_DIR/categories" -type f -name '*.rsc' -print0 |
while IFS= read -r -d '' file; do
    if grep -q 'mode=https' "$file"; then
        temporary="${file}.tmp"
        sed 's/mode=https/check-certificate=yes-without-crl/g' "$file" > "$temporary"
        mv "$temporary" "$file"
    fi
done

printf 'RouterOS fetch certificate verification enforced\n'
