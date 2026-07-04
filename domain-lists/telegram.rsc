# Telegram DNS FWD domains
# Telegram mobile app usually also needs Telegram CIDR ranges from address-lists/telegram-cidr.rsc

/ip dns static

add regexp="(^|.*\\.)telegram\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Main"
add regexp="(^|.*\\.)t\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Short Links"
add regexp="(^|.*\\.)telegram\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Old Links"
add regexp="(^|.*\\.)telegram\\.dog\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Dog Links"
add regexp="(^|.*\\.)telegra\\.ph\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegraph"
add regexp="(^|.*\\.)graph\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegraph Graph"
add regexp="(^|.*\\.)cdn-telegram\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram CDN"
add regexp="(^|.*\\.)telegram-cdn\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram CDN Alt"
add regexp="(^|.*\\.)tg\\.dev\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Dev"
add regexp="(^|.*\\.)tdesktop\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Desktop"
add regexp="(^|.*\\.)telesco\\.pe\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Telescope"
add regexp="(^|.*\\.)comments\\.app\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram Comments"
add regexp="(^|.*\\.)tx\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="Telegram TX"
