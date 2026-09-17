# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# profile=primary-to-outbound
# List: Primary combined domains + CIDR
# RouterOS address-list: DST-TO-OUTBOUND
# Last update: 2026-09-17 07:51:12 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-TO-OUTBOUND]
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:apple.com" } on-error={}
:do { add name="browser-intake-datadoghq.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:browser-intake-datadoghq.com" } on-error={}
:do { add name="chatgpt.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:chatgpt.com" } on-error={}
:do { add name="cloudflare.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:cloudflare.com" } on-error={}
:do { add name="imgix.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:imgix.net" } on-error={}
:do { add name="intercom.io" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:intercom.io" } on-error={}
:do { add name="intercomcdn.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:intercomcdn.com" } on-error={}
:do { add name="oaistatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:oaistatic.com" } on-error={}
:do { add name="oaistatsig.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:oaistatsig.com" } on-error={}
:do { add name="oaiusercontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:oaiusercontent.com" } on-error={}
:do { add name="openai.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:openai.com" } on-error={}
:do { add name="openaimerge.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:openaimerge.com" } on-error={}
:do { add name="sendgrid.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:sendgrid.net" } on-error={}
:do { add name="sentry.io" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:sentry.io" } on-error={}
:do { add name="stripe.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:stripe.com" } on-error={}
:do { add name="workos.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:workos.com" } on-error={}
:do { add name="workoscdn.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="openai:workoscdn.com" } on-error={}

/ip firewall address-list
remove [find list=DST-TO-OUTBOUND]


/ip dns static
:do { add name="a2z.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="aws:a2z.com" } on-error={}
:do { add name="amazon.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="aws:amazon.com" } on-error={}
:do { add name="amazonaws.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="aws:amazonaws.com" } on-error={}
:do { add name="awsstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="aws:awsstatic.com" } on-error={}
:do { add name="signin.aws" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="aws:signin.aws" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-cloud:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-cloud:googleapis.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-cloud:gstatic.com" } on-error={}
:do { add name="withgoogle.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-cloud:withgoogle.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="azure.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:azure.com" } on-error={}
:do { add name="azure.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:azure.net" } on-error={}
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:live.com" } on-error={}
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:microsoft.com" } on-error={}
:do { add name="microsoftonline-p.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:microsoftonline-p.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:msauth.net" } on-error={}
:do { add name="msauthimages.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:msauthimages.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:msftauth.net" } on-error={}
:do { add name="msftauthimages.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:msftauthimages.net" } on-error={}
:do { add name="windows.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-azure:windows.net" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="github.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:github.com" } on-error={}
:do { add name="github.dev" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:github.dev" } on-error={}
:do { add name="github.io" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:github.io" } on-error={}
:do { add name="githubapp.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:githubapp.com" } on-error={}
:do { add name="githubassets.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:githubassets.com" } on-error={}
:do { add name="githubcopilot.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:githubcopilot.com" } on-error={}
:do { add name="githubstatus.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:githubstatus.com" } on-error={}
:do { add name="githubusercontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="github:githubusercontent.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="figma.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="figma:figma.com" } on-error={}
:do { add name="figma.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="figma:figma.net" } on-error={}
:do { add name="figma.site" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="figma:figma.site" } on-error={}
:do { add name="figmausercontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="figma:figmausercontent.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="canva-apps.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="canva:canva-apps.com" } on-error={}
:do { add name="canva.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="canva:canva.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="transferwise.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="wise:transferwise.com" } on-error={}
:do { add name="wise.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="wise:wise.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-drive:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-drive:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-drive:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-drive:gstatic.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:ggpht.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:googleapis.com" } on-error={}
:do { add name="googlevideo.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:googlevideo.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:gstatic.com" } on-error={}
:do { add name="youtu.be" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:youtu.be" } on-error={}
:do { add name="youtube-nocookie.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:youtube-nocookie.com" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:youtube.com" } on-error={}
:do { add name="ytimg.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="youtube:ytimg.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="akamaihd.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:akamaihd.net" } on-error={}
:do { add name="steam-chat.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steam-chat.com" } on-error={}
:do { add name="steam.tv" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steam.tv" } on-error={}
:do { add name="steamcommunity.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steamcommunity.com" } on-error={}
:do { add name="steamcontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steamcontent.com" } on-error={}
:do { add name="steamgames.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steamgames.com" } on-error={}
:do { add name="steampowered.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steampowered.com" } on-error={}
:do { add name="steamserver.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steamserver.net" } on-error={}
:do { add name="steamstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steamstatic.com" } on-error={}
:do { add name="steamusercontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:steamusercontent.com" } on-error={}
:do { add name="valvesoftware.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="steam:valvesoftware.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="cdn-telegram.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:cdn-telegram.org" } on-error={}
:do { add name="comments.app" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:comments.app" } on-error={}
:do { add name="contest.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:contest.com" } on-error={}
:do { add name="fragment.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:fragment.com" } on-error={}
:do { add name="graph.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:graph.org" } on-error={}
:do { add name="quiz.directory" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:quiz.directory" } on-error={}
:do { add name="t.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:t.me" } on-error={}
:do { add name="tdesktop.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:tdesktop.com" } on-error={}
:do { add name="telega.one" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telega.one" } on-error={}
:do { add name="telegra.ph" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telegra.ph" } on-error={}
:do { add name="telegram-cdn.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telegram-cdn.org" } on-error={}
:do { add name="telegram.dog" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telegram.dog" } on-error={}
:do { add name="telegram.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telegram.me" } on-error={}
:do { add name="telegram.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telegram.org" } on-error={}
:do { add name="telegram.space" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telegram.space" } on-error={}
:do { add name="telesco.pe" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:telesco.pe" } on-error={}
:do { add name="tg.dev" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:tg.dev" } on-error={}
:do { add name="ton.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:ton.org" } on-error={}
:do { add name="toncenter.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:toncenter.com" } on-error={}
:do { add name="tx.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:tx.me" } on-error={}
:do { add name="usercontent.dev" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="telegram:usercontent.dev" } on-error={}

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
:do { add name="wa.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="whatsapp:wa.me" } on-error={}
:do { add name="whatsapp.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="whatsapp:whatsapp.com" } on-error={}
:do { add name="whatsapp.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="whatsapp:whatsapp.net" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="signal.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="signal:signal.me" } on-error={}
:do { add name="signal.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="signal:signal.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="discord.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="discord:discord.com" } on-error={}
:do { add name="discord.gg" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="discord:discord.gg" } on-error={}
:do { add name="discordapp.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="discord:discordapp.com" } on-error={}
:do { add name="discordapp.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="discord:discordapp.net" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:live.com" } on-error={}
:do { add name="microsoft365.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:microsoft365.com" } on-error={}
:do { add name="microsoftonline.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:microsoftonline.com" } on-error={}
:do { add name="msauth.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:msauth.net" } on-error={}
:do { add name="msftauth.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:msftauth.net" } on-error={}
:do { add name="msocdn.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:msocdn.com" } on-error={}
:do { add name="office.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:office.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:office.net" } on-error={}
:do { add name="office365.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:office365.com" } on-error={}
:do { add name="outlook.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:outlook.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="microsoft-365:sharepoint.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="1drv.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="onedrive:1drv.com" } on-error={}
:do { add name="1drv.ms" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="onedrive:1drv.ms" } on-error={}
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="onedrive:live.com" } on-error={}
:do { add name="onedrive.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="onedrive:onedrive.com" } on-error={}
:do { add name="sharepoint.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="onedrive:sharepoint.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="live.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="teams:live.com" } on-error={}
:do { add name="lync.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="teams:lync.com" } on-error={}
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="teams:microsoft.com" } on-error={}
:do { add name="office.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="teams:office.net" } on-error={}
:do { add name="sfbassets.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="teams:sfbassets.com" } on-error={}
:do { add name="skype.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="teams:skype.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="microsoft.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="windows-update:microsoft.com" } on-error={}
:do { add name="windowsupdate.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="windows-update:windowsupdate.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="apple-cloudkit.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="apple-app-store:apple-cloudkit.com" } on-error={}
:do { add name="apple.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="apple-app-store:apple.com" } on-error={}
:do { add name="mzstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="apple-app-store:mzstatic.com" } on-error={}
:do { add name="safebrowsing.apple" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="apple-app-store:safebrowsing.apple" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="android.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:android.com" } on-error={}
:do { add name="ggpht.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:ggpht.com" } on-error={}
:do { add name="google-analytics.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:google-analytics.com" } on-error={}
:do { add name="google.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:google.com" } on-error={}
:do { add name="googleapis.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:googleapis.com" } on-error={}
:do { add name="googleusercontent.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:googleusercontent.com" } on-error={}
:do { add name="gstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:gstatic.com" } on-error={}
:do { add name="gvt1.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:gvt1.com" } on-error={}
:do { add name="gvt2.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:gvt2.com" } on-error={}
:do { add name="gvt3.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:gvt3.com" } on-error={}
:do { add name="pki.goog" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:pki.goog" } on-error={}
:do { add name="youtube.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="google-play:youtube.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="llnwd.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:llnwd.net" } on-error={}
:do { add name="ospserver.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:ospserver.net" } on-error={}
:do { add name="samsung.cn" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:samsung.cn" } on-error={}
:do { add name="samsung.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:samsung.com" } on-error={}
:do { add name="samsungapps.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="samsung-galaxy-store:samsungapps.com" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="akamaized.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="spotify:akamaized.net" } on-error={}
:do { add name="pscdn.co" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="spotify:pscdn.co" } on-error={}
:do { add name="scdn.co" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="spotify:scdn.co" } on-error={}
:do { add name="spotify.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="spotify:spotify.com" } on-error={}
:do { add name="spotifycdn.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="spotify:spotifycdn.com" } on-error={}
:do { add name="spotifycdn.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="spotify:spotifycdn.net" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="launchpadcontent.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="ubuntu:launchpadcontent.net" } on-error={}
:do { add name="ubuntu.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="ubuntu:ubuntu.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="debian.org" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="debian:debian.org" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="redhat.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="redhat:redhat.com" } on-error={}
:do { add name="redhat.io" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="redhat:redhat.io" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="proxmox.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="proxmox:proxmox.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="docker.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="docker:docker.com" } on-error={}
:do { add name="docker.io" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="docker:docker.io" } on-error={}

/ip firewall address-list


/ip dns static
:do { add name="cdninstagram.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="instagram:cdninstagram.com" } on-error={}
:do { add name="ig.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="instagram:ig.me" } on-error={}
:do { add name="instagram.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="instagram:instagram.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="facebook.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="facebook:facebook.com" } on-error={}
:do { add name="fb.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="facebook:fb.com" } on-error={}
:do { add name="fbcdn.net" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="facebook:fbcdn.net" } on-error={}
:do { add name="fbsbx.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="facebook:fbsbx.com" } on-error={}
:do { add name="m.me" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="facebook:m.me" } on-error={}
:do { add name="messenger.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="facebook:messenger.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="t.co" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="x:t.co" } on-error={}
:do { add name="twimg.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="x:twimg.com" } on-error={}
:do { add name="twitter.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="x:twitter.com" } on-error={}
:do { add name="x.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="x:x.com" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="licdn.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="linkedin:licdn.com" } on-error={}
:do { add name="linkedin.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="linkedin:linkedin.com" } on-error={}
:do { add name="lnkd.in" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="linkedin:lnkd.in" } on-error={}

/ip firewall address-list

/ip dns static
:do { add name="redd.it" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="reddit:redd.it" } on-error={}
:do { add name="reddit.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="reddit:reddit.com" } on-error={}
:do { add name="redditmedia.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="reddit:redditmedia.com" } on-error={}
:do { add name="redditstatic.com" type=FWD match-subdomain=yes address-list=DST-TO-OUTBOUND comment="reddit:redditstatic.com" } on-error={}

/ip firewall address-list


