# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=telegram
# List: Telegram combined domains + CIDR
# RouterOS address-list: DST-TELEGRAM-TO-OUTBOUND
# Domain source: v2fly/domain-list-community telegram (community-maintained)
# Domain source URL: https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/telegram
# CIDR source: Telegram official CIDR (official)
# CIDR source URL: https://core.telegram.org/resources/cidr.txt
# Last update: 2026-07-09 10:40:38 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TELEGRAM-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdn-telegram\\.org\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:cdn-telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)comments\\.app\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:comments.app" } on-error={}
:do { add regexp="(^|.*\\.)contest\\.com\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:contest.com" } on-error={}
:do { add regexp="(^|.*\\.)fragment\\.com\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:fragment.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.org\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:graph.org" } on-error={}
:do { add regexp="(^|.*\\.)quiz\\.directory\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:quiz.directory" } on-error={}
:do { add regexp="(^|.*\\.)t\\.me\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:t.me" } on-error={}
:do { add regexp="(^|.*\\.)tdesktop\\.com\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:tdesktop.com" } on-error={}
:do { add regexp="(^|.*\\.)telega\\.one\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telega.one" } on-error={}
:do { add regexp="(^|.*\\.)telegra\\.ph\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegra.ph" } on-error={}
:do { add regexp="(^|.*\\.)telegram-cdn\\.org\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram-cdn.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.dog\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.dog" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.me\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.me" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.org\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.space\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.space" } on-error={}
:do { add regexp="(^|.*\\.)telesco\\.pe\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telesco.pe" } on-error={}
:do { add regexp="(^|.*\\.)tg\\.dev\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:tg.dev" } on-error={}
:do { add regexp="(^|.*\\.)ton\\.org\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:ton.org" } on-error={}
:do { add regexp="(^|.*\\.)toncenter\\.com\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:toncenter.com" } on-error={}
:do { add regexp="(^|.*\\.)tx\\.me\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:tx.me" } on-error={}
:do { add regexp="(^|.*\\.)usercontent\\.dev\$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:usercontent.dev" } on-error={}

/ip firewall address-list
remove [find list=DST-TELEGRAM-TO-OUTBOUND]
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.108.12.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.108.16.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.108.20.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address=91.108.8.0/22 comment="telegram-cidr" } on-error={}
