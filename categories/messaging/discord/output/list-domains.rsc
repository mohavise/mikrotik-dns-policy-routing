# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# List: Discord domains
# RouterOS address-list: DST-DISCORD-TO-OUTBOUND
# Source: Discord official application and media domains (official-owned-domains)
# Last update: 2026-07-19 01:01:56 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DISCORD-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)discord\\.com\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discord.com" } on-error={}
:do { add regexp="(^|.*\\.)discord\\.gg\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discord.gg" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.com\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discordapp.com" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.net\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discordapp.net" } on-error={}
