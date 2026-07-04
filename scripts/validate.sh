#!/bin/sh
set -eu

for file in list-telegram-domains.rsc list-telegram-cidr.rsc list-telegram-all.rsc; do
    test -s "$file"
done

grep -q '^# Project: MikroTik DNS Policy Routing' list-telegram-all.rsc
grep -q 'telegram' list-telegram-all.rsc
grep -q 'DST-TO-OUTBOUND' list-telegram-all.rsc

# Minimum sanity checks
if [ "$(grep -c 'type=FWD' list-telegram-domains.rsc)" -lt 3 ]; then
    echo "Too few Telegram domain entries"
    exit 1
fi

if [ "$(grep -c 'add list=DST-TO-OUTBOUND address=' list-telegram-cidr.rsc)" -lt 3 ]; then
    echo "Too few Telegram CIDR entries"
    exit 1
fi
