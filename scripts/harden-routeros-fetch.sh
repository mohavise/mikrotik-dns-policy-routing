#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

find "$ROOT_DIR/safe-install" "$ROOT_DIR/categories" -type f -name '*.rsc' | sort |
while IFS= read -r file; do
    temporary="${file}.tmp"
    changed=0

    if grep -q 'mode=https' "$file"; then
        sed 's/mode=https/check-certificate=yes-without-crl/g' "$file" > "$temporary"
        mv "$temporary" "$file"
        changed=1
    fi

    if grep -q 'policy=read,write,policy,test' "$file"; then
        sed 's/policy=read,write,policy,test/policy=ftp,read,write,policy,test/g' "$file" > "$temporary"
        mv "$temporary" "$file"
        changed=1
    fi

    if [ "$changed" -eq 1 ]; then
        rm -f "$temporary"
    fi
done

printf 'RouterOS fetch certificate verification and ftp permissions enforced\n'
