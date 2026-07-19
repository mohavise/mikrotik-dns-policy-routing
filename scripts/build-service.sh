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

workdir="$(mktemp -d)"
trap 'rm -rf "$workdir"' EXIT
mkdir -p "$output_dir"

domains_all="$workdir/domains.all"
cidr_all="$workdir/cidr.all"
domains_raw="$workdir/domains.raw"
cidr_raw="$workdir/cidr.raw"
domain_source_available=0
cidr_source_available=0
MAX_DROP_PERCENT="${MAX_DROP_PERCENT:-20}"

validate_source_url() {
    case "$1" in
        https://*) ;;
        *) echo "Only HTTPS source URLs are allowed for $SERVICE_NAME: $1" >&2; exit 1 ;;
    esac
}

download_source() {
    url="$1"
    destination="$2"
    validate_source_url "$url"
    curl --fail --silent --show-error --location \
        --retry 5 --retry-all-errors --retry-delay 5 \
        --connect-timeout 20 --max-time 180 \
        --user-agent "mohavise-mikrotik-dns-policy-routing/1.0" \
        "$url" -o "$destination"
}

if [ "${DOMAIN_SOURCE_URL:-}" ]; then
    if download_source "$DOMAIN_SOURCE_URL" "$domains_raw"; then
        domain_source_available=1
    else
        echo "Warning: failed to download domain source for $SERVICE_NAME; using local fallback" >&2
    fi
fi

if [ "${CIDR_SOURCE_URL:-}" ]; then
    if download_source "$CIDR_SOURCE_URL" "$cidr_raw"; then
        cidr_source_available=1
    else
        echo "Warning: failed to download CIDR source for $SERVICE_NAME; using local fallback" >&2
    fi
fi

escape_domain() {
    printf '%s' "$1" | sed 's/\./\\\\./g'
}

normalize_domains() {
    awk '
    function valid(domain, labels, count, i, label, tld) {
        if (domain == "" || length(domain) > 253) return 0
        if (domain ~ /[[:space:]]/ || domain ~ /\.\./) return 0
        if (domain ~ /^\./ || domain ~ /\.$/) return 0
        if (domain ~ /^[0-9]+(\.[0-9]+){3}$/) return 0
        if (domain !~ /^[a-z0-9.-]+$/) return 0
        count = split(domain, labels, ".")
        if (count < 2) return 0
        for (i = 1; i <= count; i++) {
            label = labels[i]
            if (label == "" || length(label) > 63) return 0
            if (label ~ /^-/ || label ~ /-$/ || label !~ /^[a-z0-9-]+$/) return 0
        }
        tld = labels[count]
        if (length(tld) < 2 || tld !~ /^[a-z]+$/) return 0
        return 1
    }
    {
        line = tolower($0)
        gsub(/\r/, "", line)
        sub(/#.*/, "", line)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", line)
        sub(/^full:/, "", line)
        sub(/^domain:/, "", line)
        if (line ~ /^(regexp:|keyword:)/) next
        sub(/^https?:\/\//, "", line)
        sub(/^\*\./, "", line)
        sub(/\/.*/, "", line)
        sub(/:.*/, "", line)
        sub(/@.*/, "", line)
        gsub(/[[:space:]]/, "", line)
        if (valid(line)) print line
    }'
}

normalize_cidrs() {
    awk '
    function valid_ipv4(ip, octets, count, i) {
        count = split(ip, octets, ".")
        if (count != 4) return 0
        for (i = 1; i <= 4; i++) {
            if (octets[i] !~ /^[0-9]+$/ || octets[i] < 0 || octets[i] > 255) return 0
        }
        return 1
    }
    {
        line = $0
        sub(/#.*/, "", line)
        gsub(/[[:space:]\r]/, "", line)
        if (line == "") next
        count = split(line, parts, "/")
        if (count != 2 || parts[2] !~ /^[0-9]+$/ || parts[2] < 0 || parts[2] > 32) next
        if (valid_ipv4(parts[1])) print line
    }'
}

read_local_domains() {
    cat "$service_dir/domains.txt" "$service_dir/manual-domains.txt" 2>/dev/null || true
}

read_external_domains() {
    cat "$domains_raw"
    cat "$service_dir/manual-domains.txt" 2>/dev/null || true
}

if [ "${DOMAIN_SOURCE_URL:-}" ] && [ "$domain_source_available" -eq 1 ]; then
    read_external_domains
else
    read_local_domains
fi | normalize_domains | sort -u > "$domains_all"

{
    if [ "${CIDR_SOURCE_URL:-}" ] && [ "$cidr_source_available" -eq 1 ]; then
        cat "$cidr_raw"
    fi
    cat "$service_dir/manual-cidr.txt" 2>/dev/null || true
} | normalize_cidrs | sort -u > "$cidr_all"

check_sudden_drop() {
    old_file="$1"
    new_count="$2"
    pattern="$3"
    label="$4"
    [ -f "$old_file" ] || return 0
    old_count="$(grep -c "$pattern" "$old_file" || true)"
    [ "$old_count" -gt 0 ] || return 0
    minimum_allowed=$((old_count * (100 - MAX_DROP_PERCENT) / 100))
    if [ "$new_count" -lt "$minimum_allowed" ]; then
        echo "$label count dropped from $old_count to $new_count; refusing to publish" >&2
        exit 1
    fi
}

domain_count="$(wc -l < "$domains_all" | tr -d ' ')"
cidr_count="$(wc -l < "$cidr_all" | tr -d ' ')"
if [ "$domain_count" -lt "${MIN_DOMAIN_RULES:-1}" ]; then
    echo "Too few $SERVICE_NAME domain entries" >&2
    exit 1
fi
if [ "$cidr_count" -lt "${MIN_CIDR_RULES:-0}" ]; then
    echo "Too few $SERVICE_NAME CIDR entries" >&2
    exit 1
fi
check_sudden_drop "$output_dir/list-domains.rsc" "$domain_count" 'type=FWD' "$SERVICE_NAME domain"
check_sudden_drop "$output_dir/list-cidr.rsc" "$cidr_count" ' add list=' "$SERVICE_NAME CIDR"

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: $SERVICE_NAME domains"
    echo "# RouterOS address-list: $LIST_NAME"
    echo "# Source: $DOMAIN_SOURCE_NAME ($DOMAIN_SOURCE_TYPE)"
    [ -z "${DOMAIN_SOURCE_URL:-}" ] || echo "# Source URL: $DOMAIN_SOURCE_URL"
    echo "# do-not-edit-manually"
    echo
    echo "/ip dns static"
    echo "remove [find address-list=$LIST_NAME comment~\"$DOMAIN_COMMENT_PREFIX\"]"
    while IFS= read -r domain; do
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
    [ -z "${CIDR_SOURCE_URL:-}" ] || echo "# Source URL: $CIDR_SOURCE_URL"
    echo "# do-not-edit-manually"
    echo
    echo "/ip firewall address-list"
    echo "remove [find list=$LIST_NAME comment=\"$CIDR_COMMENT\"]"
    while IFS= read -r cidr; do
        printf ':do { add list=%s address=%s comment="%s" } on-error={}\n' "$LIST_NAME" "$cidr" "$CIDR_COMMENT"
    done < "$cidr_all"
} > "$output_dir/list-cidr.rsc"

{
    echo "# managed-by=mohavise-mikrotik-dns-policy-routing"
    echo "# project=mikrotik-dns-policy-routing"
    echo "# service=$SERVICE_ID"
    echo "# List: $SERVICE_NAME combined domains + CIDR"
    echo "# RouterOS address-list: $LIST_NAME"
    echo "# do-not-edit-manually"
    echo
    sed '1,/^$/d' "$output_dir/list-domains.rsc"
    echo
    sed '1,/^$/d' "$output_dir/list-cidr.rsc"
} > "$output_dir/list-all.rsc"

printf 'Generated %s output: %s domains, %s CIDRs\n' "$SERVICE_NAME" "$domain_count" "$cidr_count"
