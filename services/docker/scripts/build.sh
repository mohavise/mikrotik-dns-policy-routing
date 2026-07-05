#!/bin/sh
set -eu

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
service_root="$(CDPATH= cd -- "$script_dir/.." && pwd)"
service_dir="$service_root/database"
output_dir="$service_root/output"
. "$service_dir/service.conf"

last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
domains_all="$output_dir/.domains.tmp"
cidr_all="$output_dir/.cidr.tmp"
trap 'rm -f "$domains_all" "$cidr_all"' EXIT

sed 's/#.*$//' "$service_dir/domains.txt" "$service_dir/manual-domains.txt" | tr -d ' \t\r' | sed '/^$/d' | tr '[:upper:]' '[:lower:]' | sort -u > "$domains_all"
sed 's/#.*$//' "$service_dir/manual-cidr.txt" | tr -d ' \t\r' | sed '/^$/d' | grep -E '^[0-9]+(\.[0-9]+){3}/[0-9]+$' | sort -u > "$cidr_all" || true

escape_domain() { printf '%s' "$1" | sed 's/\./\\\\./g'; }

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: $SERVICE_NAME domains"
    echo "# RouterOS address-list: $LIST_NAME"
    echo "# Source: $DOMAIN_SOURCE_NAME ($DOMAIN_SOURCE_TYPE)"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
    echo "/ip dns static"
    echo "remove [find address-list=$LIST_NAME comment~\"$DOMAIN_COMMENT_PREFIX\"]"
    while read -r domain; do
        escaped="$(escape_domain "$domain")"
        printf ':do { add regexp="(^|.*\\\\.)%s\\$" type=FWD address-list=%s comment="%s%s" } on-error={}\n' "$escaped" "$LIST_NAME" "$DOMAIN_COMMENT_PREFIX" "$domain"
    done < "$domains_all"
} > "$output_dir/list-domains.rsc"

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: $SERVICE_NAME CIDR"
    echo "# RouterOS address-list: $LIST_NAME"
    echo "# Source: manual verified additions"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
    echo "/ip firewall address-list"
    echo "remove [find list=$LIST_NAME comment=\"$CIDR_COMMENT\"]"
    while read -r cidr; do
        printf ':do { add list=%s address=%s comment="%s" } on-error={}\n' "$LIST_NAME" "$cidr" "$CIDR_COMMENT"
    done < "$cidr_all"
} > "$output_dir/list-cidr.rsc"

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: $SERVICE_NAME combined domains + CIDR"
    echo "# RouterOS address-list: $LIST_NAME"
    echo "# Domain source: $DOMAIN_SOURCE_NAME ($DOMAIN_SOURCE_TYPE)"
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
    sed '1,/^$/d' "$output_dir/list-domains.rsc"
    echo
    sed '1,/^$/d' "$output_dir/list-cidr.rsc"
} > "$output_dir/list-all.rsc"

printf 'Generated Docker output\n'

