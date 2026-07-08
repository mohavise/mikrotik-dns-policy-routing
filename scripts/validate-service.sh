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
grep -q "$SERVICE_ID" "$output_dir/list-all.rsc"
grep -q "$LIST_NAME" "$output_dir/list-all.rsc"

domain_count="$(grep -c 'type=FWD' "$output_dir/list-domains.rsc" || true)"
cidr_count="$(grep -c '/ip firewall address-list\| add list=' "$output_dir/list-cidr.rsc" || true)"

if [ "$domain_count" -lt "${MIN_DOMAIN_RULES:-1}" ]; then
    echo "Too few $SERVICE_NAME domain entries"
    exit 1
fi

if [ "$cidr_count" -lt "${MIN_CIDR_RULES:-0}" ]; then
    echo "Too few $SERVICE_NAME CIDR entries"
    exit 1
fi
