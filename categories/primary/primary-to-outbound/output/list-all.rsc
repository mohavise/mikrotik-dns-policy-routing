# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=primary-to-outbound
# List: Primary combined domains + CIDR
# RouterOS address-list: DST-TO-OUTBOUND
# Last update: 2026-07-13 11:51:10 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TO-OUTBOUND]
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
remove [find list=DST-TO-OUTBOUND]


/ip dns static
:do { add regexp="(^|.*\\.)aws\\.amazon\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:aws.amazon.com" } on-error={}
:do { add regexp="(^|.*\\.)awsstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.aws\\.a2z\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:console.aws.a2z.com" } on-error={}
:do { add regexp="(^|.*\\.)opfcaptcha-prod\\.s3\\.amazonaws\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:opfcaptcha-prod.s3.amazonaws.com" } on-error={}
:do { add regexp="(^|.*\\.)signin\\.aws\$" type=FWD address-list=DST-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)apis\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:apis.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients6\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:clients6.google.com" } on-error={}
:do { add regexp="(^|.*\\.)cloud\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:cloud.google.com" } on-error={}
:do { add regexp="(^|.*\\.)csp\\.withgoogle\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:csp.withgoogle.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)reauth\\.cloud\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-cloud:reauth.cloud.google.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)azure\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add regexp="(^|.*\\.)azure\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:azure.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:graph.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)graph\\.windows\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:graph.windows.net" } on-error={}
:do { add regexp="(^|.*\\.)login\\.live\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:login.live.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:login.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.microsoftonline\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:login.microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline-p\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msauthimages\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauthimages\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add regexp="(^|.*\\.)portal\\.azure\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-azure:portal.azure.net" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)github\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add regexp="(^|.*\\.)github\\.dev\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add regexp="(^|.*\\.)github\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add regexp="(^|.*\\.)githubapp\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add regexp="(^|.*\\.)githubassets\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add regexp="(^|.*\\.)githubcopilot\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add regexp="(^|.*\\.)githubstatus\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add regexp="(^|.*\\.)githubusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)figma\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:figma.net" } on-error={}
:do { add regexp="(^|.*\\.)figma\\.site\$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:figma.site" } on-error={}
:do { add regexp="(^|.*\\.)figmausercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)canva-apps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}
:do { add regexp="(^|.*\\.)canva\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="canva:canva.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)transferwise\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add regexp="(^|.*\\.)wise\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="wise:wise.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)docs\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:docs.google.com" } on-error={}
:do { add regexp="(^|.*\\.)drive\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:drive.google.com" } on-error={}
:do { add regexp="(^|.*\\.)drive\\.usercontent\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:drive.usercontent.google.com" } on-error={}
:do { add regexp="(^|.*\\.)forms\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:forms.google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)sheets\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:sheets.google.com" } on-error={}
:do { add regexp="(^|.*\\.)slides\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-drive:slides.google.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googlevideo\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.youtube\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:m.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.youtube\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:www.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)youtu\\.be\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add regexp="(^|.*\\.)youtube-nocookie\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add regexp="(^|.*\\.)youtube\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)youtubei\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:youtubei.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)ytimg\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)help\\.steampowered\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:help.steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)steam-chat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steam-chat.com" } on-error={}
:do { add regexp="(^|.*\\.)steam\\.tv\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steam.tv" } on-error={}
:do { add regexp="(^|.*\\.)steamcdn-a\\.akamaihd\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamcdn-a.akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)steamcommunity\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamcommunity.com" } on-error={}
:do { add regexp="(^|.*\\.)steamcontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamcontent.com" } on-error={}
:do { add regexp="(^|.*\\.)steamgames\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamgames.com" } on-error={}
:do { add regexp="(^|.*\\.)steampowered\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)steamserver\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamserver.net" } on-error={}
:do { add regexp="(^|.*\\.)steamstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)steamstore-a\\.akamaihd\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamstore-a.akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)steamusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)steamuserimages-a\\.akamaihd\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:steamuserimages-a.akamaihd.net" } on-error={}
:do { add regexp="(^|.*\\.)store\\.steampowered\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:store.steampowered.com" } on-error={}
:do { add regexp="(^|.*\\.)valvesoftware\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="steam:valvesoftware.com" } on-error={}

/ip firewall address-list


/ip dns static
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
:do { add regexp="(^|.*\\.)wa\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add regexp="(^|.*\\.)whatsapp\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)signal\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add regexp="(^|.*\\.)signal\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="signal:signal.org" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)microsoft365\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add regexp="(^|.*\\.)microsoftonline\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add regexp="(^|.*\\.)msauth\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msftauth\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add regexp="(^|.*\\.)msocdn\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add regexp="(^|.*\\.)office\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add regexp="(^|.*\\.)office365\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add regexp="(^|.*\\.)officeapps\\.live\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:officeapps.live.com" } on-error={}
:do { add regexp="(^|.*\\.)outlook\\.office\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:outlook.office.com" } on-error={}
:do { add regexp="(^|.*\\.)protection\\.outlook\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:protection.outlook.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)1drv\\.ms\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add regexp="(^|.*\\.)files\\.1drv\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:files.1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add regexp="(^|.*\\.)onedrive\\.live\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:onedrive.live.com" } on-error={}
:do { add regexp="(^|.*\\.)public\\.dm\\.files\\.1drv\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:public.dm.files.1drv.com" } on-error={}
:do { add regexp="(^|.*\\.)sharepoint\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}
:do { add regexp="(^|.*\\.)storage\\.live\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="onedrive:storage.live.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)lync\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add regexp="(^|.*\\.)sfbassets\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add regexp="(^|.*\\.)skype\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:skype.com" } on-error={}
:do { add regexp="(^|.*\\.)statics\\.teams\\.cdn\\.office\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:statics.teams.cdn.office.net" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.cdn\\.office\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:teams.cdn.office.net" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.live\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:teams.live.com" } on-error={}
:do { add regexp="(^|.*\\.)teams\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:teams.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)users\\.storage\\.live\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="teams:users.storage.live.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)delivery\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:delivery.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)dl\\.delivery\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:dl.delivery.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.windowsupdate\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:download.windowsupdate.com" } on-error={}
:do { add regexp="(^|.*\\.)emdl\\.ws\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:emdl.ws.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)prod\\.do\\.dsp\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:prod.do.dsp.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)tsfe\\.trafficshaping\\.dsp\\.mp\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:tsfe.trafficshaping.dsp.mp.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)update\\.microsoft\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:update.microsoft.com" } on-error={}
:do { add regexp="(^|.*\\.)windowsupdate\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)api\\.apple-cloudkit\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:api.apple-cloudkit.com" } on-error={}
:do { add regexp="(^|.*\\.)appattest\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:appattest.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)apps-marketplace\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:apps-marketplace.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)apps\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:apps.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)audiocontentdownload\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:audiocontentdownload.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)devimages-cdn\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:devimages-cdn.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.developer\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:download.developer.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)itunes\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:itunes.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)mzstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)playgrounds-assets-cdn\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:playgrounds-assets-cdn.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)playgrounds-cdn\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:playgrounds-cdn.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)ppq\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:ppq.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)sylvan\\.apple\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:sylvan.apple.com" } on-error={}
:do { add regexp="(^|.*\\.)token\\.safebrowsing\\.apple\$" type=FWD address-list=DST-TO-OUTBOUND comment="apple-app-store:token.safebrowsing.apple" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:accounts.google.com" } on-error={}
:do { add regexp="(^|.*\\.)accounts\\.youtube\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:accounts.youtube.com" } on-error={}
:do { add regexp="(^|.*\\.)ajax\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:ajax.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)android\\.apis\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:android.apis.google.com" } on-error={}
:do { add regexp="(^|.*\\.)android\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add regexp="(^|.*\\.)android\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:android.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)androidmanagement\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:androidmanagement.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)apis\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:apis.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients1\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:clients1.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients2\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:clients2.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients3\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:clients3.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients4\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:clients4.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients5\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:clients5.google.com" } on-error={}
:do { add regexp="(^|.*\\.)clients6\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:clients6.google.com" } on-error={}
:do { add regexp="(^|.*\\.)crl\\.pki\\.goog\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:crl.pki.goog" } on-error={}
:do { add regexp="(^|.*\\.)dl-ssl\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dl-ssl.google.com" } on-error={}
:do { add regexp="(^|.*\\.)dl\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:dl.google.com" } on-error={}
:do { add regexp="(^|.*\\.)enterprise\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:enterprise.google.com" } on-error={}
:do { add regexp="(^|.*\\.)fcm-xmpp\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:fcm-xmpp.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)fcm\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:fcm.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)firebaseinstallations\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:firebaseinstallations.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)firebaselogging\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:firebaselogging.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)fonts\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:fonts.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gcm-http\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:gcm-http.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)gcm-xmpp\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:gcm-xmpp.googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)ggpht\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add regexp="(^|.*\\.)google-analytics\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add regexp="(^|.*\\.)google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add regexp="(^|.*\\.)googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add regexp="(^|.*\\.)googleusercontent\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add regexp="(^|.*\\.)gstatic\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt1\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt2\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add regexp="(^|.*\\.)gvt3\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:m.google.com" } on-error={}
:do { add regexp="(^|.*\\.)notifications\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:notifications.google.com" } on-error={}
:do { add regexp="(^|.*\\.)ocsp\\.pki\\.goog\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:ocsp.pki.goog" } on-error={}
:do { add regexp="(^|.*\\.)ogs\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:ogs.google.com" } on-error={}
:do { add regexp="(^|.*\\.)payments\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:payments.google.com" } on-error={}
:do { add regexp="(^|.*\\.)pki\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:pki.google.com" } on-error={}
:do { add regexp="(^|.*\\.)play\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:play.google.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.google\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:www.google.com" } on-error={}
:do { add regexp="(^|.*\\.)www\\.googleapis\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="google-play:www.googleapis.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)apps-dn2\\.ospserver\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:apps-dn2.ospserver.net" } on-error={}
:do { add regexp="(^|.*\\.)apps\\.samsung\\.cn\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.cn" } on-error={}
:do { add regexp="(^|.*\\.)apps\\.samsung\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:apps.samsung.com" } on-error={}
:do { add regexp="(^|.*\\.)cdnet-dn\\.gw\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:cdnet-dn.gw.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)cf-dn\\.gw\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:cf-dn.gw.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)cn-ms\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:cn-ms.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)hub-odc\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:hub-odc.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)img\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:img.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)odc\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:odc.samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)samsappsbn\\.vo\\.llnwd\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:samsappsbn.vo.llnwd.net" } on-error={}
:do { add regexp="(^|.*\\.)samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}
:do { add regexp="(^|.*\\.)vas\\.samsungapps\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:vas.samsungapps.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)accounts\\.spotify\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:accounts.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)api\\.spotify\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:api.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)audio-ak-spotify-com\\.akamaized\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:audio-ak-spotify-com.akamaized.net" } on-error={}
:do { add regexp="(^|.*\\.)audio4-ak-spotify-com\\.akamaized\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:audio4-ak-spotify-com.akamaized.net" } on-error={}
:do { add regexp="(^|.*\\.)gew-spclient\\.spotify\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:gew-spclient.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)open\\.spotify\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:open.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)pscdn\\.co\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:pscdn.co" } on-error={}
:do { add regexp="(^|.*\\.)scdn\\.co\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:scdn.co" } on-error={}
:do { add regexp="(^|.*\\.)spclient\\.wg\\.spotify\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:spclient.wg.spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)spotify\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:spotify.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:spotifycdn.com" } on-error={}
:do { add regexp="(^|.*\\.)spotifycdn\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="spotify:spotifycdn.net" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)archive\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:archive.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)changelogs\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:changelogs.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)esm\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:esm.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)keyserver\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:keyserver.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)packages\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:packages.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)ports\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:ports.ubuntu.com" } on-error={}
:do { add regexp="(^|.*\\.)ppa\\.launchpadcontent\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:ppa.launchpadcontent.net" } on-error={}
:do { add regexp="(^|.*\\.)security\\.ubuntu\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="ubuntu:security.ubuntu.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)deb\\.debian\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:deb.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)ftp-master\\.debian\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:ftp-master.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)ftp\\.debian\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:ftp.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)packages\\.debian\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:packages.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)security\\.debian\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:security.debian.org" } on-error={}
:do { add regexp="(^|.*\\.)snapshot\\.debian\\.org\$" type=FWD address-list=DST-TO-OUTBOUND comment="debian:snapshot.debian.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)access\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:access.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)cdn\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:cdn.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)cloud\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:cloud.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)console\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:console.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)registry\\.access\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:registry.access.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)registry\\.redhat\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:registry.redhat.io" } on-error={}
:do { add regexp="(^|.*\\.)sso\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:sso.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)subscription\\.rhn\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:subscription.rhn.redhat.com" } on-error={}
:do { add regexp="(^|.*\\.)subscription\\.rhsm\\.redhat\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="redhat:subscription.rhsm.redhat.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)download\\.proxmox\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="proxmox:download.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)enterprise\\.proxmox\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="proxmox:enterprise.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)pbs\\.proxmox\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="proxmox:pbs.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)pve\\.proxmox\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="proxmox:pve.proxmox.com" } on-error={}
:do { add regexp="(^|.*\\.)shop\\.proxmox\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="proxmox:shop.proxmox.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)api\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:api.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)auth\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:auth.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)auth\\.docker\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:auth.docker.io" } on-error={}
:do { add regexp="(^|.*\\.)desktop\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:desktop.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add regexp="(^|.*\\.)docker\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:docker.io" } on-error={}
:do { add regexp="(^|.*\\.)docs\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:docs.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)download\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:download.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)hub\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:hub.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)login\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:login.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)production\\.cloudfront\\.docker\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:production.cloudfront.docker.com" } on-error={}
:do { add regexp="(^|.*\\.)registry-1\\.docker\\.io\$" type=FWD address-list=DST-TO-OUTBOUND comment="docker:registry-1.docker.io" } on-error={}

/ip firewall address-list


/ip dns static
:do { add regexp="(^|.*\\.)cdninstagram\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add regexp="(^|.*\\.)ig\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add regexp="(^|.*\\.)instagram\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)facebook\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add regexp="(^|.*\\.)fb\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add regexp="(^|.*\\.)fbcdn\\.net\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add regexp="(^|.*\\.)fbsbx\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add regexp="(^|.*\\.)m\\.me\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add regexp="(^|.*\\.)messenger\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)t\\.co\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add regexp="(^|.*\\.)twimg\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add regexp="(^|.*\\.)twitter\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add regexp="(^|.*\\.)x\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="x:x.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add regexp="(^|.*\\.)licdn\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add regexp="(^|.*\\.)linkedin\\.com\$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add regexp="(^|.*\\.)lnkd\\.in\$" type=FWD address-list=DST-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}

/ip firewall address-list


