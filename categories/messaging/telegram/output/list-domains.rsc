# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=telegram
# List: Telegram domains
# RouterOS address-list: DST-TELEGRAM-TO-OUTBOUND
# Source: v2fly/domain-list-community telegram (community-maintained)
# Source URL: https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/telegram
# Normalized source domain count: 21
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-TELEGRAM-TO-OUTBOUND]
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="cdn-telegram.org" comment="telegram:seed:cdn-telegram.org" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="comments.app" comment="telegram:seed:comments.app" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="contest.com" comment="telegram:seed:contest.com" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="fragment.com" comment="telegram:seed:fragment.com" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="graph.org" comment="telegram:seed:graph.org" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="quiz.directory" comment="telegram:seed:quiz.directory" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="t.me" comment="telegram:seed:t.me" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="tdesktop.com" comment="telegram:seed:tdesktop.com" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telega.one" comment="telegram:seed:telega.one" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telegra.ph" comment="telegram:seed:telegra.ph" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telegram-cdn.org" comment="telegram:seed:telegram-cdn.org" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telegram.dog" comment="telegram:seed:telegram.dog" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telegram.me" comment="telegram:seed:telegram.me" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telegram.org" comment="telegram:seed:telegram.org" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telegram.space" comment="telegram:seed:telegram.space" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="telesco.pe" comment="telegram:seed:telesco.pe" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="tg.dev" comment="telegram:seed:tg.dev" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="ton.org" comment="telegram:seed:ton.org" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="toncenter.com" comment="telegram:seed:toncenter.com" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="tx.me" comment="telegram:seed:tx.me" } on-error={}
:do { add list=DST-TELEGRAM-TO-OUTBOUND address="usercontent.dev" comment="telegram:seed:usercontent.dev" } on-error={}

/ip dns static
remove [find address-list=DST-TELEGRAM-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdn-telegram\\.org$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:cdn-telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)comments\\.app$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:comments.app" } on-error={}
:do { add regexp="(^|.*\\.)contest\\.com$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:contest.com" } on-error={}
:do { add regexp="(^|.*\\.)fragment\\.com$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:fragment.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.org$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:graph.org" } on-error={}
:do { add regexp="(^|.*\\.)quiz\\.directory$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:quiz.directory" } on-error={}
:do { add regexp="(^|.*\\.)t\\.me$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:t.me" } on-error={}
:do { add regexp="(^|.*\\.)tdesktop\\.com$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:tdesktop.com" } on-error={}
:do { add regexp="(^|.*\\.)telega\\.one$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telega.one" } on-error={}
:do { add regexp="(^|.*\\.)telegra\\.ph$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telegra.ph" } on-error={}
:do { add regexp="(^|.*\\.)telegram-cdn\\.org$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telegram-cdn.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.dog$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telegram.dog" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.me$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telegram.me" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.org$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.space$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telegram.space" } on-error={}
:do { add regexp="(^|.*\\.)telesco\\.pe$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:telesco.pe" } on-error={}
:do { add regexp="(^|.*\\.)tg\\.dev$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:tg.dev" } on-error={}
:do { add regexp="(^|.*\\.)ton\\.org$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:ton.org" } on-error={}
:do { add regexp="(^|.*\\.)toncenter\\.com$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:toncenter.com" } on-error={}
:do { add regexp="(^|.*\\.)tx\\.me$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:tx.me" } on-error={}
:do { add regexp="(^|.*\\.)usercontent\\.dev$" type=FWD address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:dns:usercontent.dev" } on-error={}
