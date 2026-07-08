#!/bin/sh
set -eu

if [ "$#" -ne 1 ]; then
    echo "usage: $0 categories/<category>/<service>" >&2
    exit 2
fi

service_root="$1"
service_dir="$service_root/database"
output_dir="$service_root/output"
. "$service_dir/service.conf"

last="$(date -u '+%Y-%m-%d %H:%M:%S UTC')"
workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT

domains_all="$workdir/domains.all"
cidr_all="$workdir/cidr.all"
domains_raw="$workdir/domains.raw"
cidr_raw="$workdir/cidr.raw"
domain_source_available=0
cidr_source_available=0

if [ "${DOMAIN_SOURCE_URL:-}" ]; then
    if curl -fsSL "$DOMAIN_SOURCE_URL" -o "$domains_raw"; then
        domain_source_available=1
    else
        echo "Warning: failed to download domain source for $SERVICE_NAME; using local fallback" >&2
    fi
fi

if [ "${CIDR_SOURCE_URL:-}" ]; then
    if curl -fsSL "$CIDR_SOURCE_URL" -o "$cidr_raw"; then
        cidr_source_available=1
    else
        echo "Warning: failed to download CIDR source for $SERVICE_NAME; using local fallback" >&2
    fi
fi

escape_domain() {
    printf '%s' "$1" | sed 's/\./\\\\./g'
}

read_local_domains() {
    sed 's/#.*$//' "$service_dir/domains.txt" "$service_dir/manual-domains.txt" 2>/dev/null || true
}

read_external_domains() {
    awk '
    /^[[:space:]]*#/ { next }
    /^[[:space:]]*$/ { next }
    /^full:/ { sub(/^full:/, ""); print; next }
    /^domain:/ { sub(/^domain:/, ""); print; next }
    /^regexp:/ { next }
    /^keyword:/ { next }
    { print }
    ' "$domains_raw"
    sed 's/#.*$//' "$service_dir/manual-domains.txt" 2>/dev/null || true
}

if [ "${DOMAIN_SOURCE_URL:-}" ] && [ "$domain_source_available" -eq 1 ]; then
    read_external_domains
else
    read_local_domains
fi |
    sed 's/@.*$//' |
    tr -d ' \t\r' |
    sed '/^$/d' |
    tr '[:upper:]' '[:lower:]' |
    sort -u > "$domains_all"

{
    if [ "${CIDR_SOURCE_URL:-}" ] && [ "$cidr_source_available" -eq 1 ]; then
        sed 's/#.*$//' "$cidr_raw"
    fi
    sed 's/#.*$//' "$service_dir/manual-cidr.txt" 2>/dev/null || true
} |
    tr -d ' \t\r' |
    sed '/^$/d' |
    grep -E '^[0-9]+(\.[0-9]+){3}/[0-9]+$' |
    sort -u > "$cidr_all" || true

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: $SERVICE_NAME domains"
    echo "# RouterOS address-list: $LIST_NAME"
    echo "# Source: $DOMAIN_SOURCE_NAME ($DOMAIN_SOURCE_TYPE)"
    if [ "${DOMAIN_SOURCE_URL:-}" ]; then
        echo "# Source URL: $DOMAIN_SOURCE_URL"
    fi
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
    echo "# Source: ${CIDR_SOURCE_NAME:-manual verified additions}${CIDR_SOURCE_TYPE:+ ($CIDR_SOURCE_TYPE)}"
    if [ "${CIDR_SOURCE_URL:-}" ]; then
        echo "# Source URL: $CIDR_SOURCE_URL"
    fi
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
    if [ "${DOMAIN_SOURCE_URL:-}" ]; then
        echo "# Domain source URL: $DOMAIN_SOURCE_URL"
    fi
    if [ "${CIDR_SOURCE_URL:-}" ]; then
        echo "# CIDR source: $CIDR_SOURCE_NAME ($CIDR_SOURCE_TYPE)"
        echo "# CIDR source URL: $CIDR_SOURCE_URL"
    fi
    echo "# Last update: $last"
    echo "# do-not-edit-manually"
    echo
    sed '1,/^$/d' "$output_dir/list-domains.rsc"
    echo
    sed '1,/^$/d' "$output_dir/list-cidr.rsc"
} > "$output_dir/list-all.rsc"

printf 'Generated %s output\n' "$SERVICE_NAME"
