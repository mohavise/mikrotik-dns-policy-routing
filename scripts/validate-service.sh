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

if grep -Ev '^(#|$|/ip dns static|remove \[find address-list=|:do \{ add regexp=)' "$output_dir/list-domains.rsc" | grep -q .; then
    echo "Unexpected content in $SERVICE_NAME domain output" >&2
    exit 1
fi

if grep -Ev '^(#|$|/ip firewall address-list|remove \[find list=|:do \{ add list=)' "$output_dir/list-cidr.rsc" | grep -q .; then
    echo "Unexpected content in $SERVICE_NAME CIDR output" >&2
    exit 1
fi

domain_count="$(grep -c 'type=FWD' "$output_dir/list-domains.rsc" || true)"
cidr_count="$(grep -c '^:do { add list=' "$output_dir/list-cidr.rsc" || true)"

if [ "$domain_count" -lt "${MIN_DOMAIN_RULES:-1}" ]; then
    echo "Too few $SERVICE_NAME domain entries" >&2
    exit 1
fi

if [ "$cidr_count" -lt "${MIN_CIDR_RULES:-0}" ]; then
    echo "Too few $SERVICE_NAME CIDR entries" >&2
    exit 1
fi

expected_all=$((domain_count + cidr_count))
actual_all="$(grep -c '^:do { add ' "$output_dir/list-all.rsc" || true)"
if [ "$actual_all" -ne "$expected_all" ]; then
    echo "$SERVICE_NAME combined output count mismatch" >&2
    exit 1
fi

if [ "$(grep '^:do { add regexp=' "$output_dir/list-domains.rsc" | sort | uniq -d | wc -l | tr -d ' ')" -ne 0 ]; then
    echo "Duplicate domain rules found for $SERVICE_NAME" >&2
    exit 1
fi

if [ "$(grep '^:do { add list=' "$output_dir/list-cidr.rsc" | sort | uniq -d | wc -l | tr -d ' ')" -ne 0 ]; then
    echo "Duplicate CIDR rules found for $SERVICE_NAME" >&2
    exit 1
fi
