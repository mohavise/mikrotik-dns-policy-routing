#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

run_build() {
    name="$1"
    script="$2"
    printf '\n==> build %s\n' "$name"
    "$ROOT_DIR/$script"
}

printf 'managed-by=mohavise-mikrotik-dns-policy-routing\n'
printf 'project=mikrotik-dns-policy-routing\n'
printf 'job=build-all\n'

run_build "service: telegram" "services/telegram/scripts/build.sh"
run_build "service: instagram" "services/instagram/scripts/build.sh"
run_build "service: whatsapp" "services/whatsapp/scripts/build.sh"
run_build "service: facebook" "services/facebook/scripts/build.sh"
run_build "service: x" "services/x/scripts/build.sh"
run_build "service: linkedin" "services/linkedin/scripts/build.sh"
run_build "service: signal" "services/signal/scripts/build.sh"
run_build "service: figma" "services/figma/scripts/build.sh"
run_build "service: canva" "services/canva/scripts/build.sh"
run_build "service: github" "services/github/scripts/build.sh"
run_build "service: openai" "services/openai/scripts/build.sh"

run_build "profile: ai-to-outbound" "profiles/ai-to-outbound/scripts/build.sh"
run_build "profile: developer-to-outbound" "profiles/developer-to-outbound/scripts/build.sh"
run_build "profile: messaging-to-outbound" "profiles/messaging-to-outbound/scripts/build.sh"
run_build "profile: social-media-to-outbound" "profiles/social-media-to-outbound/scripts/build.sh"
run_build "profile: design-to-outbound" "profiles/design-to-outbound/scripts/build.sh"
run_build "profile: primary-to-outbound" "profiles/primary-to-outbound/scripts/build.sh"

printf '\nBuild complete\n'
