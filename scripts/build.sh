#!/bin/sh
set -eu

last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
list="DST-TO-OUTBOUND"
domain_src="https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/telegram"
cidr_src="https://core.telegram.org/resources/cidr.txt"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

domains_raw="$workdir/telegram-domains.raw"
cidr_raw="$workdir/telegram-cidr.raw"

curl -fsSL "$domain_src" -o "$domains_raw"
curl -fsSL "$cidr_src" -o "$cidr_raw"

header_domains() {
    echo "# Project: MikroTik DNS Policy Routing"
    echo "# Maintainer: mohavise"
    echo "# List: Telegram domains"
    echo "# RouterOS address-list: $list"
    echo "# Source: $domain_src"
    echo "# Last update: $last"
    echo "# WARNING: generated file. Do not edit manually."
    echo
    echo "/ip dns static"
}

header_cidr() {
    echo "# Project: MikroTik DNS Policy Routing"
    echo "# Maintainer: mohavise"
    echo "# List: Telegram CIDR"
    echo "# RouterOS address-list: $list"
    echo "# Source: $cidr_src"
    echo "# Last update: $last"
    echo "# WARNING: generated file. Do not edit manually."
    echo
    echo "/ip firewall address-list"
}

escape_domain() {
    printf '%s' "$1" | sed 's/\./\\\\./g'
}

make_domains() {
    awk '
        /^[[:space:]]*#/ { next }
        /^[[:space:]]*$/ { next }
        /^full:/ { sub(/^full:/, ""); print; next }
        /^domain:/ { sub(/^domain:/, ""); print; next }
        /^regexp:/ { next }
        /^keyword:/ { next }
        { print }
    ' "$domains_raw" \
    | sed 's/@.*$//' \
    | tr -d ' \t\r' \
    | sed '/^$/d' \
    | tr '[:upper:]' '[:lower:]' \
    | sort -u
}

make_cidr() {
    sed 's/#.*$//' "$cidr_raw" \
    | tr -d ' \t\r' \
    | sed '/^$/d' \
    | sort -u
}

{
    header_domains
    make_domains | while read -r domain; do
        escaped="$(escape_domain "$domain")"
        printf ':do { add regexp="(^|.*\\\\.)%s\\$" type=FWD address-list=%s comment="telegram:%s" } on-error={}\n' "$escaped" "$list" "$domain"
    done
} > list-telegram-domains.rsc

{
    header_cidr
    make_cidr | while read -r cidr; do
        printf ':do { add list=%s address=%s comment="telegram-cidr" } on-error={}\n' "$list" "$cidr"
    done
} > list-telegram-cidr.rsc

{
    cat list-telegram-domains.rsc
    echo
    cat list-telegram-cidr.rsc
} > list-telegram-all.rsc

printf 'Generated:\n'
printf '  list-telegram-domains.rsc\n'
printf '  list-telegram-cidr.rsc\n'
printf '  list-telegram-all.rsc\n'
