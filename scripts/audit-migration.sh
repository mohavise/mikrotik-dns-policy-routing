#!/bin/sh
set -eu

fail=0
legacy_services="services"
legacy_groups="groups"
legacy_profiles="profiles"
slash="/"

pass() {
    printf 'PASS: %s\n' "$1"
}

fail_check() {
    printf 'FAIL: %s\n' "$1"
    fail=1
}

check_no_legacy_calls() {
    script="$1"
    label="$2"

    if grep -Eq "\"$legacy_services$slash[^\"]*/scripts/(build|validate)\\.sh\"|\"$legacy_profiles$slash[^\"]*/scripts/(build|validate)\\.sh\"| $legacy_groups$slash|^$legacy_groups$slash" "$script"; then
        fail_check "$label does not call legacy implementation paths"
    else
        pass "$label uses category-first execution paths"
    fi

    if grep -F "categories/" "$script" >/dev/null 2>&1; then
        pass "$label references categories/"
    else
        fail_check "$label references categories/"
    fi
}

check_no_legacy_safe_fetches() {
    if grep -E "(:local (installerPath|updatePath|schedulerPath)|/tool fetch|/import).*\"($legacy_services|$legacy_profiles|$legacy_groups)$slash" safe-install-*.rsc >/dev/null 2>&1; then
        fail_check "root safe-install wrappers do not fetch/import legacy implementation paths"
    else
        pass "root primary installer does not fetch legacy implementation paths"
    fi
}

check_root_installers() {
    extra_root_installers="$(find . -maxdepth 1 -name 'safe-install-*-outbound.rsc' ! -name 'safe-install-outbound.rsc' -type f -print)"

    if [ -n "$extra_root_installers" ]; then
        printf '%s\n' "$extra_root_installers"
        fail_check "no root service/category safe installers exist"
    else
        pass "no root service/category safe installers exist"
    fi

    if [ -f safe-install-outbound.rsc ]; then
        pass "root primary safe-install-outbound.rsc exists"
    else
        fail_check "root primary safe-install-outbound.rsc exists"
    fi

    if [ -d safe-install/primary ]; then
        fail_check "safe-install/primary is absent"
    else
        pass "safe-install/primary is absent"
    fi
}

check_category_profile_paths() {
    missing=0

    for script in scripts/build-all.sh scripts/validate-all.sh; do
        sed -n 's/.*"\(categories\/[^\"]*\/scripts\/[^\"]*\.sh\)".*/\1/p' "$script" |
        while IFS= read -r path; do
            if [ ! -f "$path" ]; then
                printf 'FAIL: missing category execution script: %s\n' "$path"
                exit 1
            fi
        done || missing=1
    done

    if [ "$missing" -eq 0 ]; then
        pass "all category execution scripts referenced by build/validate exist"
    else
        fail=1
    fi
}

check_no_category_scripts_dirs() {
    category_scripts="$(find categories -path '*/scripts' -type d -print)"

    if [ -n "$category_scripts" ]; then
        printf '%s\n' "$category_scripts"
        fail_check "category-local scripts directories are absent"
    else
        pass "category-local scripts directories are absent"
    fi
}

check_no_empty_directories() {
    empty_dirs="$(find categories safe-install -type d -empty -print)"

    if [ -n "$empty_dirs" ]; then
        printf '%s\n' "$empty_dirs"
        fail_check "empty category/safe-install directories are absent"
    else
        pass "empty category/safe-install directories are absent"
    fi
}

check_workflow_staging() {
    workflow_file=".github/workflows/update-generated-lists.yml"

    if grep -F -- "find categories safe-install" "$workflow_file" >/dev/null 2>&1 &&
       grep -F -- "-name '*.rsc'" "$workflow_file" >/dev/null 2>&1 &&
       grep -F -- "-name 'README.md'" "$workflow_file" >/dev/null 2>&1 &&
       grep -F -- "git add" "$workflow_file" >/dev/null 2>&1; then
        pass "workflow stages generated RouterOS files"
        pass "workflow stages generated category and service install guides"
    else
        fail_check "workflow stages generated RouterOS files"
        fail_check "workflow stages generated category and service install guides"
    fi
}

check_no_legacy_calls scripts/build-all.sh "build-all"
check_no_legacy_calls scripts/validate-all.sh "validate-all"
check_no_legacy_safe_fetches
check_root_installers
check_no_category_scripts_dirs
check_no_empty_directories
check_workflow_staging

if grep -F "scripts/generate-install-readmes.sh" scripts/build-all.sh >/dev/null 2>&1; then
    pass "build-all generates category and service install guides"
else
    fail_check "build-all generates category and service install guides"
fi

if [ -d categories ]; then
    pass "categories/ exists"
else
    fail_check "categories/ exists"
fi

if [ -d safe-install ]; then
    pass "safe-install/ exists"
else
    fail_check "safe-install/ exists"
fi

for legacy_dir in "$legacy_services" "$legacy_groups" "$legacy_profiles"; do
    if [ -d "$legacy_dir" ]; then
        fail_check "legacy $legacy_dir directory has been removed"
    else
        pass "legacy $legacy_dir directory has been removed"
    fi
done

check_category_profile_paths

if [ "$fail" -eq 0 ]; then
    printf 'Migration audit passed\n'
else
    printf 'Migration audit failed\n'
    exit 1
fi
