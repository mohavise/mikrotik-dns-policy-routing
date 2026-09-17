# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=telegram
# List: Telegram domains
# RouterOS address-list: DST-TELEGRAM-TO-OUTBOUND
# Source: v2fly/domain-list-community telegram (community-maintained)
# Source URL: https://raw.githubusercontent.com/v2fly/domain-list-community/master/data/telegram
# Normalized source domain count: 21
# Child domains are omitted when a listed parent already covers them via match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TELEGRAM-TO-OUTBOUND]
:do { add name="cdn-telegram.org" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:cdn-telegram.org" } on-error={}
:do { add name="comments.app" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:comments.app" } on-error={}
:do { add name="contest.com" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:contest.com" } on-error={}
:do { add name="fragment.com" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:fragment.com" } on-error={}
:do { add name="graph.org" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:graph.org" } on-error={}
:do { add name="quiz.directory" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:quiz.directory" } on-error={}
:do { add name="t.me" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:t.me" } on-error={}
:do { add name="tdesktop.com" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:tdesktop.com" } on-error={}
:do { add name="telega.one" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telega.one" } on-error={}
:do { add name="telegra.ph" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegra.ph" } on-error={}
:do { add name="telegram-cdn.org" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram-cdn.org" } on-error={}
:do { add name="telegram.dog" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.dog" } on-error={}
:do { add name="telegram.me" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.me" } on-error={}
:do { add name="telegram.org" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.org" } on-error={}
:do { add name="telegram.space" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telegram.space" } on-error={}
:do { add name="telesco.pe" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:telesco.pe" } on-error={}
:do { add name="tg.dev" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:tg.dev" } on-error={}
:do { add name="ton.org" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:ton.org" } on-error={}
:do { add name="toncenter.com" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:toncenter.com" } on-error={}
:do { add name="tx.me" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:tx.me" } on-error={}
:do { add name="usercontent.dev" type=FWD match-subdomain=yes address-list=DST-TELEGRAM-TO-OUTBOUND comment="telegram:usercontent.dev" } on-error={}
