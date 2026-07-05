# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=primary-to-outbound
# List: Primary combined domains + CIDR
# RouterOS address-list: DST-TO-OUTBOUND
# Last update: 2026-07-05 14:04:02 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"openai:"]
:do { add regexp="(^|.*\\.)auth\\.openai\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:auth.openai.com" } on-error={}
:do { add regexp="(^|.*\\.)challenges\\.cloudflare\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:challenges.cloudflare.com" } on-error={}
:do { add regexp="(^|.*\\.)chatgpt\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:chatgpt.com" } on-error={}
:do { add regexp="(^|.*\\.)ct\\.sendgrid\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:ct.sendgrid.net" } on-error={}
:do { add regexp="(^|.*\\.)humb\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:humb.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)images\\.workoscdn\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:images.workoscdn.com" } on-error={}
:do { add regexp="(^|.*\\.)intercom\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:intercom.io" } on-error={}
:do { add regexp="(^|.*\\.)intercomcdn\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:intercomcdn.com" } on-error={}
:do { add regexp="(^|.*\\.)js\\.stripe\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:js.stripe.com" } on-error={}
:do { add regexp="(^|.*\\.)o207216\\.ingest\\.sentry\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:o207216.ingest.sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)o33249\\.ingest\\.sentry\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:o33249.ingest.sentry.io" } on-error={}
:do { add regexp="(^|.*\\.)oaistatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:oaistatic.com" } on-error={}
:do { add regexp="(^|.*\\.)oaistatsig\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:oaistatsig.com" } on-error={}
:do { add regexp="(^|.*\\.)oaiusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:oaiusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)openai\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:openai.com" } on-error={}
:do { add regexp="(^|.*\\.)openaimerge\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:openaimerge.com" } on-error={}
:do { add regexp="(^|.*\\.)rum\\.browser-intake-datadoghq\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:rum.browser-intake-datadoghq.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:workos.com" } on-error={}
:do { add regexp="(^|.*\\.)workos\\.imgix\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="openai:workos.imgix.net" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="openai-cidr"]


/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"github:"]
:do { add regexp="(^|.*\\.)github\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="github-cidr"]


/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"canva:"]
:do { add regexp="(^|.*\\.)canva\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="canva:canva.com" } on-error={}
:do { add regexp="(^|.*\\.)canva-apps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="canva-cidr"]

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"figma:"]
:do { add regexp="(^|.*\\.)figma\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="figma-cidr"]


/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"facebook:"]
:do { add regexp="(^|.*\\.)facebook\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="facebook-cidr"]

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"instagram:"]
:do { add regexp="(^|.*\\.)cdninstagram\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="instagram-cidr"]

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"linkedin:"]
:do { add regexp="(^|.*\\.)licdn\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in\$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="linkedin-cidr"]

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"signal:"]
:do { add regexp="(^|.*\\.)signal\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="signal:signal.org" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="signal-cidr"]

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"telegram:"]
:do { add regexp="(^|.*\\.)cdn-telegram\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:cdn-telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)comments\\.app\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:comments.app" } on-error={}
:do { add regexp="(^|.*\\.)contest\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:contest.com" } on-error={}
:do { add regexp="(^|.*\\.)fragment\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:fragment.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:graph.org" } on-error={}
:do { add regexp="(^|.*\\.)quiz\\.directory\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:quiz.directory" } on-error={}
:do { add regexp="(^|.*\\.)t\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:t.me" } on-error={}
:do { add regexp="(^|.*\\.)tdesktop\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:tdesktop.com" } on-error={}
:do { add regexp="(^|.*\\.)telega\\.one\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telega.one" } on-error={}
:do { add regexp="(^|.*\\.)telegra\\.ph\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegra.ph" } on-error={}
:do { add regexp="(^|.*\\.)telegram-cdn\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram-cdn.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.dog\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.dog" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.me" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.org" } on-error={}
:do { add regexp="(^|.*\\.)telegram\\.space\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telegram.space" } on-error={}
:do { add regexp="(^|.*\\.)telesco\\.pe\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:telesco.pe" } on-error={}
:do { add regexp="(^|.*\\.)tg\\.dev\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:tg.dev" } on-error={}
:do { add regexp="(^|.*\\.)ton\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:ton.org" } on-error={}
:do { add regexp="(^|.*\\.)toncenter\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:toncenter.com" } on-error={}
:do { add regexp="(^|.*\\.)tx\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:tx.me" } on-error={}
:do { add regexp="(^|.*\\.)usercontent\\.dev\$" type=FWD address-list=DST-TO-OUTBOUND comment="telegram:usercontent.dev" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="telegram-cidr"]
:do { add list=DST-TO-OUTBOUND address=149.154.160.0/20 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=185.76.151.0/24 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.105.192.0/23 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.12.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.16.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.20.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.4.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.56.0/22 comment="telegram-cidr" } on-error={}
:do { add list=DST-TO-OUTBOUND address=91.108.8.0/22 comment="telegram-cidr" } on-error={}

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"whatsapp:"]
:do { add regexp="(^|.*\\.)wa\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="whatsapp-cidr"]

/ip dns static
remove [find address-list=DST-TO-OUTBOUND comment~"x:"]
:do { add regexp="(^|.*\\.)t\\.co\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:x.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND comment="x-cidr"]


