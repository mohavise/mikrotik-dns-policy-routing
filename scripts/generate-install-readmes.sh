#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"
BASE_URL="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main"
BT='`'

install_block() {
    file_name="$1"
    relative_path="$2"
    cat <<EOF
${BT}${BT}${BT}routeros
/tool fetch url="$BASE_URL/$relative_path" dst-path=$file_name check-certificate=yes-without-crl
/import file-name=$file_name
/file remove [find name=$file_name]
${BT}${BT}${BT}
EOF
}

verify_block() {
    list_name="$1"
    script_name="$2"
    scheduler_name="$3"
    cat <<EOF
${BT}${BT}${BT}routeros
/ip dns static print where address-list=$list_name
/ip firewall address-list print where list=$list_name
/system script print where name=$script_name
/system scheduler print where name=$scheduler_name
${BT}${BT}${BT}
EOF
}

write_service_readme() {
    output_file="$1"
    service_name="$2"
    list_name="$3"
    category_id="$4"
    service_id="$5"

    install_file="safe-install-$service_id-outbound.rsc"
    install_path="safe-install/$category_id/$service_id/$install_file"
    update_script="update-$service_id-outbound"
    scheduler="$update_script"

    mkdir -p "$(dirname "$output_file")"
    cat > "$output_file" <<EOF
# $service_name for MikroTik

Install only the **$service_name** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | ${BT}$list_name${BT} |
| Update script | ${BT}$update_script${BT} |
| Daily scheduler | ${BT}$scheduler${BT} |
| Installer | ${BT}$install_path${BT} |

## Install

$(install_block "$install_file" "$install_path")

The installer downloads the managed updater and scheduler, installs them without duplicates, and runs the first update.

## Requirements

Clients must use the MikroTik router for DNS so DNS Static FWD rules can learn destination IP addresses:

${BT}${BT}${BT}routeros
/ip dns set allow-remote-requests=yes
${BT}${BT}${BT}

Prevent client DNS bypass separately when required by your network design.

## Verify

$(verify_block "$list_name" "$update_script" "$scheduler")

Run an update manually:

${BT}${BT}${BT}routeros
/system script run $update_script
${BT}${BT}${BT}

## Use for policy routing

${BT}${BT}${BT}routeros
/ip firewall mangle add chain=prerouting dst-address-list=$list_name action=mark-routing new-routing-mark=to-outbound passthrough=no comment="$service_name to outbound"
${BT}${BT}${BT}

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

${BT}${BT}${BT}routeros
/system scheduler remove [find name=$scheduler]
/system script remove [find name=$update_script]
/ip dns static remove [find address-list=$list_name]
/ip firewall address-list remove [find list=$list_name]
${BT}${BT}${BT}

Do not manually add custom entries to ${BT}$list_name${BT}; use a separate custom address list.
EOF
}

find "$ROOT_DIR/categories" -mindepth 4 -maxdepth 4 -path '*/database/service.conf' -type f | sort |
while IFS= read -r service_conf; do
    service_root="$(dirname "$(dirname "$service_conf")")"
    . "$service_conf"

    category_id="$(basename "$(dirname "$service_root")")"
    service_id="$(basename "$service_root")"

    write_service_readme "$service_root/README.md" "$SERVICE_NAME" "$LIST_NAME" "$category_id" "$service_id"
    write_service_readme "$ROOT_DIR/safe-install/$category_id/$service_id/README.md" "$SERVICE_NAME" "$LIST_NAME" "$category_id" "$service_id"
done

find "$ROOT_DIR/categories" -mindepth 3 -maxdepth 3 -path '*/*-to-outbound/services.txt' -type f | sort |
while IFS= read -r services_file; do
    profile_root="$(dirname "$services_file")"
    category_root="$(dirname "$profile_root")"
    category_id="$(basename "$category_root")"

    [ "$category_id" = "primary" ] && continue

    display_name="$(printf '%s' "$category_id" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) substr($i,2)}}1')"
    list_name="DST-$(printf '%s' "$category_id" | tr '[:lower:]' '[:upper:]')-TO-OUTBOUND"
    install_file="safe-install-$category_id-to-outbound.rsc"
    install_path="safe-install/$category_id/$install_file"
    update_script="update-$category_id-to-outbound"
    scheduler="$update_script"

    service_rows=""
    while IFS= read -r service_id || [ -n "$service_id" ]; do
        service_id="$(printf '%s' "$service_id" | sed 's/#.*$//; s/^[[:space:]]*//; s/[[:space:]]*$//')"
        [ -z "$service_id" ] && continue
        service_conf="$category_root/$service_id/database/service.conf"
        if [ -f "$service_conf" ]; then
            SERVICE_NAME=""
            LIST_NAME=""
            . "$service_conf"
            service_rows="$service_rows
| [$SERVICE_NAME](./$service_id/) | ${BT}$LIST_NAME${BT} |"
        fi
    done < "$services_file"

    category_readme="$category_root/README.md"
    cat > "$category_readme" <<EOF
# $display_name Category for MikroTik

Install the complete **$display_name** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | ${BT}$list_name${BT} |
| Update script | ${BT}$update_script${BT} |
| Daily scheduler | ${BT}$scheduler${BT} |
| Installer | ${BT}$install_path${BT} |

## Install the complete category

$(install_block "$install_file" "$install_path")

## Included services

| Service | Individual list |
| --- | --- |$service_rows

To install only one service, open that service folder and use its README.

## Requirements

${BT}${BT}${BT}routeros
/ip dns set allow-remote-requests=yes
${BT}${BT}${BT}

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

$(verify_block "$list_name" "$update_script" "$scheduler")

Run an update manually:

${BT}${BT}${BT}routeros
/system script run $update_script
${BT}${BT}${BT}

## Policy-routing example

${BT}${BT}${BT}routeros
/ip firewall mangle add chain=prerouting dst-address-list=$list_name action=mark-routing new-routing-mark=to-outbound passthrough=no comment="$display_name to outbound"
${BT}${BT}${BT}

## Remove

${BT}${BT}${BT}routeros
/system scheduler remove [find name=$scheduler]
/system script remove [find name=$update_script]
/ip dns static remove [find address-list=$list_name]
/ip firewall address-list remove [find list=$list_name]
${BT}${BT}${BT}

Do not manually add entries to the managed category list. Use a separate custom list.
EOF

    mkdir -p "$ROOT_DIR/safe-install/$category_id"
    cp "$category_readme" "$ROOT_DIR/safe-install/$category_id/README.md"
done

# Categories without a combined profile still receive an index of individual installers.
find "$ROOT_DIR/categories" -mindepth 1 -maxdepth 1 -type d | sort |
while IFS= read -r category_root; do
    category_id="$(basename "$category_root")"
    [ "$category_id" = "primary" ] && continue
    [ -f "$category_root/$category_id-to-outbound/services.txt" ] && continue

    safe_category="$ROOT_DIR/safe-install/$category_id"
    [ -d "$safe_category" ] || continue

    display_name="$(printf '%s' "$category_id" | tr '-' ' ' | awk '{for(i=1;i<=NF;i++){$i=toupper(substr($i,1,1)) substr($i,2)}}1')"
    rows=""
    service_conf_list="$(find "$category_root" -mindepth 3 -maxdepth 3 -path '*/database/service.conf' -type f | sort)"
    old_ifs=$IFS
    IFS='
'
    for service_conf in $service_conf_list; do
        [ -n "$service_conf" ] || continue
        service_root="$(dirname "$(dirname "$service_conf")")"
        service_id="$(basename "$service_root")"
        SERVICE_NAME=""
        LIST_NAME=""
        . "$service_conf"
        rows="$rows
| [$SERVICE_NAME](./$service_id/) | ${BT}$LIST_NAME${BT} |"
    done
    IFS=$old_ifs

    cat > "$safe_category/README.md" <<EOF
# $display_name Installers

This category does not currently provide one combined category installer. Install the required services individually.

| Service | Address list |
| --- | --- |$rows
EOF
done

printf 'Generated category and service installation README files under categories/ and safe-install/\n'
