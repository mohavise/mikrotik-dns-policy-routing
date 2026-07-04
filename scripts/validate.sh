#!/bin/sh
set -eu

fail=0

check_domain() {
  domain="$1"
  case "$domain" in
    *[!a-zA-Z0-9.-]*|.*|*..*|*-.*|*.-*|*-.|*.) return 1 ;;
    *.*) return 0 ;;
    *) return 1 ;;
  esac
}

for file in sources/domains/*.txt; do
  [ -f "$file" ] || continue
  while IFS= read -r line; do
    clean=$(printf '%s' "$line" | sed 's/#.*$//' | tr -d ' \t\r')
    [ -z "$clean" ] && continue
    if ! check_domain "$clean"; then
      echo "Invalid domain in $file: $clean"
      fail=1
    fi
  done < "$file"
done

for file in sources/cidr/*.txt; do
  [ -f "$file" ] || continue
  while IFS= read -r line; do
    clean=$(printf '%s' "$line" | sed 's/#.*$//' | tr -d ' \t\r')
    [ -z "$clean" ] && continue
    case "$clean" in
      */*) : ;;
      *) echo "Invalid CIDR in $file: $clean"; fail=1 ;;
    esac
  done < "$file"
done

exit "$fail"
