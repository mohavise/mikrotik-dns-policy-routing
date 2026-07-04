# Starter DNS FWD domains
# Address-list: DST-TO-OUTBOUND

/ip dns static

# GitHub
add regexp="(^|.*\\.)github\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="GitHub"
add regexp="(^|.*\\.)githubusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="GitHub Content"
add regexp="(^|.*\\.)githubassets\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="GitHub Assets"
add regexp="(^|.*\\.)github\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="GitHub Pages"

# OpenAI / ChatGPT
add regexp="(^|.*\\.)openai\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="OpenAI"
add regexp="(^|.*\\.)chatgpt\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ChatGPT"
add regexp="(^|.*\\.)oaistatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="OpenAI Static"
add regexp="(^|.*\\.)oaiusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="OpenAI Content"

# Google / YouTube
add regexp="(^|.*\\.)google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="Google"
add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="Google APIs"
add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="Google Static"
add regexp="(^|.*\\.)youtube\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="YouTube"
add regexp="(^|.*\\.)youtu\\.be\$" type=FWD address-list=DST-TO-OUTBOUND comment="YouTube Short"
add regexp="(^|.*\\.)ytimg\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="YouTube Images"
add regexp="(^|.*\\.)googlevideo\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="YouTube Video CDN"
