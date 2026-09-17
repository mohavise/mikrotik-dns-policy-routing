# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=messaging-to-outbound
# List: messaging combined domains + CIDR
# RouterOS address-list: DST-MESSAGING-TO-OUTBOUND
# Last update: 2026-09-17 07:15:07 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-MESSAGING-TO-OUTBOUND]
:do { add name="cdn-telegram.org" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:cdn-telegram.org" } on-error={}
:do { add name="comments.app" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:comments.app" } on-error={}
:do { add name="contest.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:contest.com" } on-error={}
:do { add name="fragment.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:fragment.com" } on-error={}
:do { add name="graph.org" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:graph.org" } on-error={}
:do { add name="quiz.directory" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:quiz.directory" } on-error={}
:do { add name="t.me" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:t.me" } on-error={}
:do { add name="tdesktop.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:tdesktop.com" } on-error={}
:do { add name="telega.one" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telega.one" } on-error={}
:do { add name="telegra.ph" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telegra.ph" } on-error={}
:do { add name="telegram-cdn.org" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telegram-cdn.org" } on-error={}
:do { add name="telegram.dog" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telegram.dog" } on-error={}
:do { add name="telegram.me" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telegram.me" } on-error={}
:do { add name="telegram.org" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telegram.org" } on-error={}
:do { add name="telegram.space" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telegram.space" } on-error={}
:do { add name="telesco.pe" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:telesco.pe" } on-error={}
:do { add name="tg.dev" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:tg.dev" } on-error={}
:do { add name="ton.org" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:ton.org" } on-error={}
:do { add name="toncenter.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:toncenter.com" } on-error={}
:do { add name="tx.me" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:tx.me" } on-error={}
:do { add name="usercontent.dev" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="telegram:usercontent.dev" } on-error={}

/ip firewall address-list
remove [find list=DST-MESSAGING-TO-OUTBOUND]
:do { add list=DST-MESSAGING-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.12.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.16.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.20.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-MESSAGING-TO-OUTBOUND address=91.108.8.0/22 comment="telegram-cidr" } on-error={}

/ip dns static
:do { add name="wa.me" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add name="whatsapp.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add name="whatsapp.net" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="signal.me" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add name="signal.org" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="signal:signal.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="discord.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:discord.com" } on-error={}
:do { add name="discord.gg" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:discord.gg" } on-error={}
:do { add name="discordapp.com" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:discordapp.com" } on-error={}
:do { add name="discordapp.net" type=FWD match-subdomain=yes address-list=DST-MESSAGING-TO-OUTBOUND comment="discord:discordapp.net" } on-error={}

/ip firewall address-list

