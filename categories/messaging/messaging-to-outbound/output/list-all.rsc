# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=messaging-to-outbound
# List: messaging combined domains + CIDR
# RouterOS address-list: DST-MESSAGING-TO-OUTBOUND
# Last update: 2026-09-18 09:29:04 UTC
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
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.8.0/21 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.16.0/21 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}

/ip firewall address-list
:do { add list=DST-MESSAGING-TO-OUTBOUND address="wa.me" comment="whatsapp:seed:wa.me" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="whatsapp.com" comment="whatsapp:seed:whatsapp.com" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address="whatsapp.net" comment="whatsapp:seed:whatsapp.net" } on-error={}

/ip dns static
:do { add regexp="(^|.*\\.)wa\\.me$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:dns:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:dns:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net$" type=FWD address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:dns:whatsapp.net" } on-error={}

/ip firewall address-list
:do { add list=DST-MESSAGING-TO-OUTBOUND address=31.13.24.0/21 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=31.13.64.0/18 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=45.64.40.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.0.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.2.0/23 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.4.0/23 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.6.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.8.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.10.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.12.0/23 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.14.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.16.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.20.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.22.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.141.24.0/24 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=57.144.0.0/14 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=66.220.144.0/20 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=69.63.176.0/20 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=69.171.224.0/19 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=74.119.76.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=102.132.96.0/20 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=103.4.96.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=129.134.0.0/17 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=157.240.0.0/17 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=157.240.192.0/18 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=163.70.128.0/17 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=163.77.132.0/23 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=163.77.136.0/23 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=163.77.160.0/20 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=173.252.64.0/18 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=179.60.192.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=185.60.216.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=185.89.216.0/22 comment="whatsapp-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=204.15.20.0/22 comment="whatsapp-cidr" } on-error={}

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

