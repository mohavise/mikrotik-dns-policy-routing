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

run_validate "category service: telegram" "categories/messaging/telegram/scripts/validate.sh"
run_validate "category service: instagram" "categories/social-media/instagram/scripts/validate.sh"
run_validate "category service: whatsapp" "categories/messaging/whatsapp/scripts/validate.sh"
run_validate "category service: facebook" "categories/social-media/facebook/scripts/validate.sh"
run_validate "category service: x" "categories/social-media/x/scripts/validate.sh"
run_validate "category service: linkedin" "categories/social-media/linkedin/scripts/validate.sh"
run_validate "category service: signal" "categories/messaging/signal/scripts/validate.sh"
run_validate "category service: figma" "categories/design/figma/scripts/validate.sh"
run_validate "category service: canva" "categories/design/canva/scripts/validate.sh"
run_validate "category service: github" "categories/developer/github/scripts/validate.sh"
run_validate "category service: openai" "categories/ai/openai/scripts/validate.sh"
run_validate "category service: ubuntu" "categories/package-repositories/ubuntu/scripts/validate.sh"
run_validate "category service: debian" "categories/package-repositories/debian/scripts/validate.sh"
run_validate "category service: redhat" "categories/package-repositories/redhat/scripts/validate.sh"
run_validate "category service: proxmox" "categories/package-repositories/proxmox/scripts/validate.sh"
run_validate "category service: docker" "categories/package-repositories/docker/scripts/validate.sh"
run_validate "category service: google-drive" "categories/cloud-storage/google-drive/scripts/validate.sh"
run_validate "category service: youtube" "categories/video-streaming/youtube/scripts/validate.sh"
run_validate "category service: spotify" "categories/music/spotify/scripts/validate.sh"
run_validate "category service: steam" "categories/gaming/steam/scripts/validate.sh"
run_validate "category service: apple-app-store" "categories/mobile-app-store/apple-app-store/scripts/validate.sh"
run_validate "category service: google-play" "categories/mobile-app-store/google-play/scripts/validate.sh"
run_validate "category service: samsung-galaxy-store" "categories/mobile-app-store/samsung-galaxy-store/scripts/validate.sh"

run_validate "category profile: ai-to-outbound" "categories/ai/ai-to-outbound/scripts/validate.sh"
run_validate "category profile: developer-to-outbound" "categories/developer/developer-to-outbound/scripts/validate.sh"
run_validate "category profile: package-repositories-to-outbound" "categories/package-repositories/package-repositories-to-outbound/scripts/validate.sh"
run_validate "category profile: cloud-storage-to-outbound" "categories/cloud-storage/cloud-storage-to-outbound/scripts/validate.sh"
run_validate "category profile: video-streaming-to-outbound" "categories/video-streaming/video-streaming-to-outbound/scripts/validate.sh"
run_validate "profile: google-services-to-outbound" "profiles/google-services-to-outbound/scripts/validate.sh"
run_validate "category profile: music-to-outbound" "categories/music/music-to-outbound/scripts/validate.sh"
run_validate "category profile: gaming-to-outbound" "categories/gaming/gaming-to-outbound/scripts/validate.sh"
run_validate "category profile: mobile-app-store-to-outbound" "categories/mobile-app-store/mobile-app-store-to-outbound/scripts/validate.sh"
run_validate "category profile: messaging-to-outbound" "categories/messaging/messaging-to-outbound/scripts/validate.sh"
run_validate "category profile: social-media-to-outbound" "categories/social-media/social-media-to-outbound/scripts/validate.sh"
run_validate "category profile: design-to-outbound" "categories/design/design-to-outbound/scripts/validate.sh"
run_validate "profile: primary-to-outbound" "profiles/primary-to-outbound/scripts/validate.sh"

printf '\nValidation complete\n'
