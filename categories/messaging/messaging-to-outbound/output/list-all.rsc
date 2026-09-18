# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=messaging-to-outbound
# List: messaging combined domains + CIDR
# RouterOS address-list: DST-MESSAGING-TO-OUTBOUND
# Last update: 2026-09-18 08:53:04 UTC
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-MESSAGING-TO-OUTBOUND]
:do { add list=DST-MESSAGING-TO-OUTBOUND address="cdn-telegram.org" comment="telegram:seed:cdn-telegram.org" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="comments.app" comment="telegram:seed:comments.app" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="contest.com" comment="telegram:seed:contest.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="fragment.com" comment="telegram:seed:fragment.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="graph.org" comment="telegram:seed:graph.org" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="quiz.directory" comment="telegram:seed:quiz.directory" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="t.me" comment="telegram:seed:t.me" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="tdesktop.com" comment="telegram:seed:tdesktop.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telega.one" comment="telegram:seed:telega.one" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telegra.ph" comment="telegram:seed:telegra.ph" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telegram-cdn.org" comment="telegram:seed:telegram-cdn.org" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telegram.dog" comment="telegram:seed:telegram.dog" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telegram.me" comment="telegram:seed:telegram.me" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telegram.org" comment="telegram:seed:telegram.org" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telegram.space" comment="telegram:seed:telegram.space" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="telesco.pe" comment="telegram:seed:telesco.pe" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="tg.dev" comment="telegram:seed:tg.dev" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="ton.org" comment="telegram:seed:ton.org" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="toncenter.com" comment="telegram:seed:toncenter.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="tx.me" comment="telegram:seed:tx.me" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="usercontent.dev" comment="telegram:seed:usercontent.dev" } on-error={}

/ip dns static
remove [find address-list=DST-MESSAGING-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)cdn-telegram\\.org$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:cdn-telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)comments\\.app$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:comments.app" } on-error={}
:do { add regexp="(^|.*\\.)contest\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:contest.com" } on-error={}
:do { add regexp="(^|.*\\.)fragment\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:fragment.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.org$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:graph.org" } on-error={}
:do { add regexp="(^|.*\\.)quiz\\.directory$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:quiz.directory" } on-error={}
:do { add regexp="(^|.*\\.)t\\.me$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:t.me" } on-error={}
:do { add regexp="(^|.*\\.)tdesktop\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:tdesktop.com" } on-error={}
:do { add regexp="(^|.*\\.)telega\\.one$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telega.one" } on-error={}
:do { add regexp="(^|.*\\.)telegra\\.ph$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telegra.ph" } on-error={}
:do { add regexp="(^|.*\\.)telegram-cdn\\.org$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telegram-cdn.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.dog$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telegram.dog" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.me$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telegram.me" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.org$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.space$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telegram.space" } on-error={}
:do { add regexp="(^|.*\\.)telesco\\.pe$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:telesco.pe" } on-error={}
:do { add regexp="(^|.*\\.)tg\\.dev$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:tg.dev" } on-error={}
:do { add regexp="(^|.*\\.)ton\\.org$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:ton.org" } on-error={}
:do { add regexp="(^|.*\\.)toncenter\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:toncenter.com" } on-error={}
:do { add regexp="(^|.*\\.)tx\\.me$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:tx.me" } on-error={}
:do { add regexp="(^|.*\\.)usercontent\\.dev$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:dns:usercontent.dev" } on-error={}

/ip firewall address-list
:do { add list=DST-MESSAGING-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.12.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.16.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.20.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.8.0/22 comment="telegram-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-MESSAGING-TO-OUTBOUND address="wa.me" comment="whatsapp:seed:wa.me" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="whatsapp.com" comment="whatsapp:seed:whatsapp.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="whatsapp.net" comment="whatsapp:seed:whatsapp.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)wa\\.me$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:dns:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:dns:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:dns:whatsapp.net" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MESSAGING-TO-OUTBOUND address="signal.me" comment="signal:seed:signal.me" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="signal.org" comment="signal:seed:signal.org" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)signal\\.me$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="signal:dns:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="signal:dns:signal.org" } on-error={}

/ip firewall address-list

/ip firewall address-list
:do { add list=DST-MESSAGING-TO-OUTBOUND address="discord.com" comment="discord:seed:discord.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="discord.gg" comment="discord:seed:discord.gg" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="discordapp.com" comment="discord:seed:discordapp.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="discordapp.net" comment="discord:seed:discordapp.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)discord\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:dns:discord.com" } on-error={}
:do { add regexp="(^|.*\\.)discord\\.gg$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:dns:discord.gg" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:dns:discordapp.com" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.net$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:dns:discordapp.net" } on-error={}

/ip firewall address-list

