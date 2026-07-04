# Project: MikroTik DNS Policy Routing
# Maintainer: mohavise
# List: Telegram domains
# RouterOS address-list: DST-TO-OUTBOUND
# Source: https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/telegram
# Last update: manual bootstrap
# WARNING: generated file. Do not edit manually.

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"telegram:"]
:do { add regexp="(^|.*\\.)cdn-telegram\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:cdn-telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)comments\\.app\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:comments.app" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:graph.org" } on-error={}
:do { add regexp="(^|.*\\.)t\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:t.me" } on-error={}
:do { add regexp="(^|.*\\.)tdesktop\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:tdesktop.com" } on-error={}
:do { add regexp="(^|.*\\.)telegra\\.ph\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegra.ph" } on-error={}
:do { add regexp="(^|.*\\.)telegram-cdn\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram-cdn.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.dog\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.dog" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.me" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)telesco\\.pe\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telesco.pe" } on-error={}
:do { add regexp="(^|.*\\.)tg\\.dev\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:tg.dev" } on-error={}
:do { add regexp="(^|.*\\.)tx\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:tx.me" } on-error={}
