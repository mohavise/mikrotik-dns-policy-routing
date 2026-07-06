#!/bin/sh
set -eu

ROOT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)"

run_validate() {
    name="$1"
    script="$2"
    printf '\n==> validate %s\n' "$name"
    "$ROOT_DIR/$script"
}

printf 'managed-by=mohavise-mikrotik-dns-policy-routing\n'
printf 'project=mikrotik-dns-policy-routing\n'
printf 'job=validate-all\n'

run_validate "service: telegram" "services/telegram/scripts/validate.sh"
run_validate "service: instagram" "services/instagram/scripts/validate.sh"
run_validate "service: whatsapp" "services/whatsapp/scripts/validate.sh"
run_validate "service: facebook" "services/facebook/scripts/validate.sh"
run_validate "service: x" "services/x/scripts/validate.sh"
run_validate "service: linkedin" "services/linkedin/scripts/validate.sh"
run_validate "service: signal" "services/signal/scripts/validate.sh"
run_validate "service: figma" "services/figma/scripts/validate.sh"
run_validate "service: canva" "services/canva/scripts/validate.sh"
run_validate "service: github" "services/github/scripts/validate.sh"
run_validate "service: openai" "services/openai/scripts/validate.sh"
run_validate "service: ubuntu" "services/ubuntu/scripts/validate.sh"
run_validate "service: debian" "services/debian/scripts/validate.sh"
run_validate "service: redhat" "services/redhat/scripts/validate.sh"
run_validate "service: proxmox" "services/proxmox/scripts/validate.sh"
run_validate "service: docker" "services/docker/scripts/validate.sh"
run_validate "service: google-drive" "services/google-drive/scripts/validate.sh"
run_validate "service: youtube" "services/youtube/scripts/validate.sh"
run_validate "service: spotify" "services/spotify/scripts/validate.sh"
run_validate "service: steam" "services/steam/scripts/validate.sh"
run_validate "service: apple-app-store" "services/apple-app-store/scripts/validate.sh"

run_validate "profile: ai-to-outbound" "profiles/ai-to-outbound/scripts/validate.sh"
run_validate "profile: developer-to-outbound" "profiles/developer-to-outbound/scripts/validate.sh"
run_validate "profile: package-repositories-to-outbound" "profiles/package-repositories-to-outbound/scripts/validate.sh"
run_validate "profile: cloud-storage-to-outbound" "profiles/cloud-storage-to-outbound/scripts/validate.sh"
run_validate "profile: video-streaming-to-outbound" "profiles/video-streaming-to-outbound/scripts/validate.sh"
run_validate "profile: google-services-to-outbound" "profiles/google-services-to-outbound/scripts/validate.sh"
run_validate "profile: music-to-outbound" "profiles/music-to-outbound/scripts/validate.sh"
run_validate "profile: gaming-to-outbound" "profiles/gaming-to-outbound/scripts/validate.sh"
run_validate "profile: mobile-app-store-to-outbound" "profiles/mobile-app-store-to-outbound/scripts/validate.sh"
run_validate "profile: messaging-to-outbound" "profiles/messaging-to-outbound/scripts/validate.sh"
run_validate "profile: social-media-to-outbound" "profiles/social-media-to-outbound/scripts/validate.sh"
run_validate "profile: design-to-outbound" "profiles/design-to-outbound/scripts/validate.sh"
run_validate "profile: primary-to-outbound" "profiles/primary-to-outbound/scripts/validate.sh"

printf '\nValidation complete\n'
