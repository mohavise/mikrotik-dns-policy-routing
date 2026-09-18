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
seed_domains="$workdir/seed-domains.txt"
actual_regex="$workdir/actual-regex.txt"
expected_regex="$workdir/expected-regex.txt"

for file in list-domains.rsc list-cidr.rsc list-all.rsc; do
    test -s "$output_dir/$file"
done

grep -q '^# managed-by=mohavise-mikrotik-dns-policy-routing' "$output_dir/list-all.rsc"
grep -q "# service=$SERVICE_ID" "$output_dir/list-all.rsc"
grep -q "$LIST_NAME" "$output_dir/list-all.rsc"

if grep -q '# Last update:' "$output_dir/list-domains.rsc" "$output_dir/list-cidr.rsc" "$output_dir/list-all.rsc"; then
    echo "Non-deterministic timestamp found for $SERVICE_NAME" >&2
    exit 1
fi

if grep -Ev '^(#|$|/ip firewall address-list|/ip dns static|remove \[find list=|remove \[find address-list=|:do \{ add list=|:do \{ add regexp=)' "$output_dir/list-domains.rsc" | grep -q .; then
    echo "Unexpected content in $SERVICE_NAME domain output" >&2
    exit 1
fi

if grep -Ev '^(#|$|/ip firewall address-list|remove \[find list=|:do \{ add list=)' "$output_dir/list-cidr.rsc" | grep -q .; then
    echo "Unexpected content in $SERVICE_NAME CIDR output" >&2
    exit 1
fi

if grep -q 'forward-to=' "$output_dir/list-domains.rsc"; then
    echo "Per-domain forward-to is not allowed for $SERVICE_NAME" >&2
    exit 1
fi

if grep -q 'match-subdomain=' "$output_dir/list-domains.rsc"; then
    echo "match-subdomain rules are not allowed in hybrid output for $SERVICE_NAME" >&2
    exit 1
fi

if grep -q '^:do { add name=' "$output_dir/list-domains.rsc"; then
    echo "Plain DNS name rules are not allowed in hybrid output for $SERVICE_NAME" >&2
    exit 1
fi

seed_count="$(grep -Fc "comment=\"${DOMAIN_COMMENT_PREFIX}seed:" "$output_dir/list-domains.rsc" || true)"
regex_count="$(grep -Fc "comment=\"${DOMAIN_COMMENT_PREFIX}dns:" "$output_dir/list-domains.rsc" || true)"
cidr_count="$(grep -c '^:do { add list=' "$output_dir/list-cidr.rsc" || true)"
source_cidr_count="$(sed -n 's/^# Normalized source CIDR count: //p' "$output_dir/list-cidr.rsc" | head -n 1)"

if [ "$seed_count" -lt 1 ]; then
    echo "No generated $SERVICE_NAME FQDN seed entries" >&2
    exit 1
fi

if [ "$regex_count" -ne "$seed_count" ]; then
    echo "$SERVICE_NAME FQDN seed/regex count mismatch: $seed_count seeds, $regex_count regex rules" >&2
    exit 1
fi

case "$source_cidr_count" in
    ''|*[!0-9]*)
        echo "Missing or invalid normalized source CIDR count for $SERVICE_NAME" >&2
        exit 1
        ;;
esac

if [ "$source_cidr_count" -lt "${MIN_CIDR_RULES:-0}" ]; then
    echo "Too few $SERVICE_NAME normalized source CIDR entries" >&2
    exit 1
fi

sed -n 's/^:do { add list=[^ ]* address="\([^"]*\)" comment="[^"]*seed:[^"]*" } on-error={}$/\1/p' \
    "$output_dir/list-domains.rsc" | sort -u > "$seed_domains"

if [ "$(wc -l < "$seed_domains" | tr -d ' ')" -ne "$seed_count" ]; then
    echo "Duplicate or malformed FQDN seed rules found for $SERVICE_NAME" >&2
    exit 1
fi

# Output seeds must contain only broad base parent domains. For common ccTLD
# forms (for example co.uk or com.au), one additional registrant label stays.
if ! awk '
function base_domain(domain, labels, count, second, last) {
    count = split(domain, labels, ".")
    if (count <= 2) return domain

    last = labels[count]
    second = labels[count - 1]

    if (length(last) == 2 && second ~ /^(ac|co|com|edu|gov|mil|net|org)$/ && count >= 3) {
        return labels[count - 2] "." second "." last
    }

    return second "." last
}
{
    if ($0 != base_domain($0)) {
        print "Non-base domain in generated output: " $0 > "/dev/stderr"
        bad = 1
    }
}
END { exit bad ? 1 : 0 }
' "$seed_domains"; then
    echo "$SERVICE_NAME contains generated child/subdomain seed rules" >&2
    exit 1
fi

sed -n 's/^:do { add regexp="\([^"]*\)" type=FWD address-list=[^ ]* comment="[^"]*dns:[^"]*" } on-error={}$/\1/p' \
    "$output_dir/list-domains.rsc" | sort -u > "$actual_regex"

if [ "$(wc -l < "$actual_regex" | tr -d ' ')" -ne "$regex_count" ]; then
    echo "Duplicate or malformed DNS regex rules found for $SERVICE_NAME" >&2
    exit 1
fi

while IFS= read -r domain; do
    escaped_domain="$(printf '%s\n' "$domain" | sed 's/\./\\\\./g')"
    printf '(^|.*\\\\.)%s$\n' "$escaped_domain"
done < "$seed_domains" | sort -u > "$expected_regex"

if ! diff -u "$expected_regex" "$actual_regex" >/dev/null; then
    echo "$SERVICE_NAME DNS regex rules do not exactly match the FQDN seed domains" >&2
    diff -u "$expected_regex" "$actual_regex" >&2 || true
    exit 1
fi

expected_all=$((seed_count + regex_count + cidr_count))
actual_all="$(grep -c '^:do { add ' "$output_dir/list-all.rsc" || true)"
if [ "$actual_all" -ne "$expected_all" ]; then
    echo "$SERVICE_NAME combined output count mismatch" >&2
    exit 1
fi

if [ "$(grep '^:do { add list=' "$output_dir/list-cidr.rsc" | sort | uniq -d | wc -l | tr -d ' ')" -ne 0 ]; then
    echo "Duplicate CIDR rules found for $SERVICE_NAME" >&2
    exit 1
fi


# Generated CIDRs must already be the exact minimal collapse of their own
# represented address set. If collapse_addresses() changes the list, the
# generator left covered or mergeable sibling networks behind.
python3 - "$output_dir/list-cidr.rsc" <<'PY'
import ipaddress
import re
import sys

path = sys.argv[1]
networks = []

with open(path, "r", encoding="utf-8") as handle:
    for line in handle:
        match = re.match(r'^:do \{ add list=[^ ]+ address=([^ ]+) comment="[^"]+" \} on-error=\{\}$', line.rstrip())
        if not match:
            continue
        network = ipaddress.ip_network(match.group(1), strict=False)
        if network.version == 4:
            networks.append(network)

actual = sorted(networks, key=lambda net: (int(net.network_address), net.prefixlen))
collapsed = list(ipaddress.collapse_addresses(actual))
collapsed.sort(key=lambda net: (int(net.network_address), net.prefixlen))

if actual != collapsed:
    print("CIDR output is not fully collapsed into exact supernets", file=sys.stderr)
    sys.exit(1)
PY
