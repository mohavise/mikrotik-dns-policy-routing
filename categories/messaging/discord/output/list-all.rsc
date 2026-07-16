# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# List: Discord combined domains + CIDR
# RouterOS address-list: DST-DISCORD-TO-OUTBOUND
# Domain source: Discord official application and media domains (official-owned-domains)
# Last update: 2026-07-16 00:56:31 UTC
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DISCORD-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)discord\\.com\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discord.com" } on-error={}
:do { add regexp="(^|.*\\.)discord\\.gg\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discord.gg" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.com\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discordapp.com" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.net\$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discordapp.net" } on-error={}

/ip firewall address-list
remove [find list=DST-DISCORD-TO-OUTBOUND]
