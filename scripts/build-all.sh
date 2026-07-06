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

run_build "category service: telegram" "categories/messaging/telegram/scripts/build.sh"
run_build "category service: instagram" "categories/social-media/instagram/scripts/build.sh"
run_build "category service: whatsapp" "categories/messaging/whatsapp/scripts/build.sh"
run_build "category service: facebook" "categories/social-media/facebook/scripts/build.sh"
run_build "category service: x" "categories/social-media/x/scripts/build.sh"
run_build "category service: linkedin" "categories/social-media/linkedin/scripts/build.sh"
run_build "category service: signal" "categories/messaging/signal/scripts/build.sh"
run_build "category service: figma" "categories/design/figma/scripts/build.sh"
run_build "category service: canva" "categories/design/canva/scripts/build.sh"
run_build "category service: github" "categories/developer/github/scripts/build.sh"
run_build "category service: openai" "categories/ai/openai/scripts/build.sh"
run_build "category service: ubuntu" "categories/package-repositories/ubuntu/scripts/build.sh"
run_build "category service: debian" "categories/package-repositories/debian/scripts/build.sh"
run_build "category service: redhat" "categories/package-repositories/redhat/scripts/build.sh"
run_build "category service: proxmox" "categories/package-repositories/proxmox/scripts/build.sh"
run_build "category service: docker" "categories/package-repositories/docker/scripts/build.sh"
run_build "category service: google-drive" "categories/cloud-storage/google-drive/scripts/build.sh"
run_build "category service: youtube" "categories/video-streaming/youtube/scripts/build.sh"
run_build "category service: spotify" "categories/music/spotify/scripts/build.sh"
run_build "category service: steam" "categories/gaming/steam/scripts/build.sh"
run_build "category service: apple-app-store" "categories/mobile-app-store/apple-app-store/scripts/build.sh"
run_build "category service: google-play" "categories/mobile-app-store/google-play/scripts/build.sh"
run_build "category service: samsung-galaxy-store" "categories/mobile-app-store/samsung-galaxy-store/scripts/build.sh"

run_build "category profile: ai-to-outbound" "categories/ai/ai-to-outbound/scripts/build.sh"
run_build "category profile: developer-to-outbound" "categories/developer/developer-to-outbound/scripts/build.sh"
run_build "category profile: package-repositories-to-outbound" "categories/package-repositories/package-repositories-to-outbound/scripts/build.sh"
run_build "category profile: cloud-storage-to-outbound" "categories/cloud-storage/cloud-storage-to-outbound/scripts/build.sh"
run_build "category profile: video-streaming-to-outbound" "categories/video-streaming/video-streaming-to-outbound/scripts/build.sh"
run_build "profile: google-services-to-outbound" "profiles/google-services-to-outbound/scripts/build.sh"
run_build "category profile: music-to-outbound" "categories/music/music-to-outbound/scripts/build.sh"
run_build "category profile: gaming-to-outbound" "categories/gaming/gaming-to-outbound/scripts/build.sh"
run_build "category profile: mobile-app-store-to-outbound" "categories/mobile-app-store/mobile-app-store-to-outbound/scripts/build.sh"
run_build "category profile: messaging-to-outbound" "categories/messaging/messaging-to-outbound/scripts/build.sh"
run_build "category profile: social-media-to-outbound" "categories/social-media/social-media-to-outbound/scripts/build.sh"
run_build "category profile: design-to-outbound" "categories/design/design-to-outbound/scripts/build.sh"
run_build "profile: primary-to-outbound" "profiles/primary-to-outbound/scripts/build.sh"

printf '\nBuild complete\n'
