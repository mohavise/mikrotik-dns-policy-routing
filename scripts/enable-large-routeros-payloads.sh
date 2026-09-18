#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

find "$ROOT_DIR/categories" -path '*/routeros/update.rsc' -type f | sort |
while IFS= read -r file; do
    python3 - "$file" <<'PY'
from pathlib import Path
import sys

path = Path(sys.argv[1])
text = path.read_text(encoding="utf-8")
old = ':local payload [/file get [find name=\\$fileName] contents]\n:if (([:len \\$payload] = 0) || ([:find \\$payload \\$addrList] = nil)) do='
new = ':local payloadSize [/file get [find name=\\$fileName] size]\n:if (\\$payloadSize = 0) do='
if old in text:
    text = text.replace(old, new)
    path.write_text(text, encoding="utf-8")
PY
done

printf 'RouterOS updaters use file-size validation for large payload support\n'
