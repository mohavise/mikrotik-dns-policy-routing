#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
service_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
service_dir="$service_root/database"
output_dir="$service_root/output"
. "$service_dir/service.conf"

last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
list="$LIST_NAME"
domain_src="$DOMAIN_SOURCE_URL"
cidr_src="$CIDR_SOURCE_URL"

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

domains_raw="$workdir/telegram-domains.raw"
cidr_raw="$workdir/telegram-cidr.raw"
domains_all="$workdir/telegram-domains.all"
cidr_all="$workdir/telegram-cidr.all"

curl -fsSL "$domain_src" -o "$domains_raw"
curl -fsSL "$cidr_src" -o "$cidr_raw"

header_domains() {
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: Telegram domains"
    echo "# RouterOS address-list: $list"
    echo "# Source: $DOMAIN_SOURCE_NAME ($DOMAIN_SOURCE_TYPE)"
    echo "# Source URL: $domain_src"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
    echo "/ip dns static"
    echo "remove [find address-list=$list comment~\"$DOMAIN_COMMENT_PREFIX\"]"
}

header_cidr() {
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: Telegram CIDR"
    echo "# RouterOS address-list: $list"
    echo "# Source: $CIDR_SOURCE_NAME ($CIDR_SOURCE_TYPE)"
    echo "# Source URL: $cidr_src"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
    echo "/ip firewall address-list"
    echo "remove [find list=$list comment=\"$CIDR_COMMENT\"]"
}

header_all() {
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: Telegram combined domains + CIDR"
    echo "# RouterOS address-list: $list"
    echo "# Domain source: $DOMAIN_SOURCE_NAME ($DOMAIN_SOURCE_TYPE)"
    echo "# Domain source URL: $domain_src"
    echo "# CIDR source: $CIDR_SOURCE_NAME ($CIDR_SOURCE_TYPE)"
    echo "# CIDR source URL: $cidr_src"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
}

escape_domain() {
    printf '%s' "$1" | sed 's/\./\\\\./g'
}

make_domains() {
    {
        awk '
        /^[[:space:]]*#/ { next }
        /^[[:space:]]*$/ { next }
        /^full:/ { sub(/^full:/, ""); print; next }
        /^domain:/ { sub(/^domain:/, ""); print; next }
        /^regexp:/ { next }
        /^keyword:/ { next }
        { print }
        ' "$domains_raw"
        sed 's/#.*$//' "$service_dir/manual-domains.txt"
    } \
    | sed 's/@.*$//' \
    | tr -d ' \t\r' \
    | sed '/^$/d' \
    | tr '[:upper:]' '[:lower:]' \
    | sort -u
}

make_cidr() {
    {
        sed 's/#.*$//' "$cidr_raw"
        sed 's/#.*$//' "$service_dir/manual-cidr.txt"
    } \
    | tr -d ' \t\r' \
    | sed '/^$/d' \
    | grep -E '^[0-9]+(\.[0-9]+){3}/[0-9]+$' \
    | sort -u
}

make_domains > "$domains_all"
make_cidr > "$cidr_all"

{
    header_domains
    while read -r domain; do
        escaped="$(escape_domain "$domain")"
        printf ':do { add regexp="(^|.*\\\\.)%s\\$" type=FWD address-list=%s comment="%s%s" } on-error={}\n' "$escaped" "$list" "$DOMAIN_COMMENT_PREFIX" "$domain"
    done < "$domains_all"
} > "$output_dir/list-domains.rsc"

{
    header_cidr
    while read -r cidr; do
        printf ':do { add list=%s address=%s comment="%s" } on-error={}\n' "$list" "$cidr" "$CIDR_COMMENT"
    done < "$cidr_all"
} > "$output_dir/list-cidr.rsc"

{
    header_all
    sed '1,/^$/d' "$output_dir/list-domains.rsc"
    echo
    sed '1,/^$/d' "$output_dir/list-cidr.rsc"
} > "$output_dir/list-all.rsc"

printf 'Generated:\n'
printf '  services/telegram/output/list-domains.rsc\n'
printf '  services/telegram/output/list-cidr.rsc\n'
printf '  services/telegram/output/list-all.rsc\n'
