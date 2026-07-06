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
run_build "service: ubuntu" "services/ubuntu/scripts/build.sh"
run_build "service: debian" "services/debian/scripts/build.sh"
run_build "service: redhat" "services/redhat/scripts/build.sh"
run_build "service: proxmox" "services/proxmox/scripts/build.sh"
run_build "service: docker" "services/docker/scripts/build.sh"
run_build "service: google-drive" "services/google-drive/scripts/build.sh"
run_build "service: youtube" "services/youtube/scripts/build.sh"
run_build "service: spotify" "services/spotify/scripts/build.sh"
run_build "service: steam" "services/steam/scripts/build.sh"
run_build "category service: apple-app-store" "categories/mobile-app-store/apple-app-store/scripts/build.sh"
run_build "category service: google-play" "categories/mobile-app-store/google-play/scripts/build.sh"

run_build "profile: ai-to-outbound" "profiles/ai-to-outbound/scripts/build.sh"
run_build "profile: developer-to-outbound" "profiles/developer-to-outbound/scripts/build.sh"
run_build "profile: package-repositories-to-outbound" "profiles/package-repositories-to-outbound/scripts/build.sh"
run_build "profile: cloud-storage-to-outbound" "profiles/cloud-storage-to-outbound/scripts/build.sh"
run_build "profile: video-streaming-to-outbound" "profiles/video-streaming-to-outbound/scripts/build.sh"
run_build "profile: google-services-to-outbound" "profiles/google-services-to-outbound/scripts/build.sh"
run_build "profile: music-to-outbound" "profiles/music-to-outbound/scripts/build.sh"
run_build "profile: gaming-to-outbound" "profiles/gaming-to-outbound/scripts/build.sh"
run_build "category profile: mobile-app-store-to-outbound" "categories/mobile-app-store/mobile-app-store-to-outbound/scripts/build.sh"
run_build "profile: messaging-to-outbound" "profiles/messaging-to-outbound/scripts/build.sh"
run_build "profile: social-media-to-outbound" "profiles/social-media-to-outbound/scripts/build.sh"
run_build "profile: design-to-outbound" "profiles/design-to-outbound/scripts/build.sh"
run_build "profile: primary-to-outbound" "profiles/primary-to-outbound/scripts/build.sh"

printf '\nBuild complete\n'
