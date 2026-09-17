# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# List: Discord domains
# RouterOS address-list: DST-DISCORD-TO-OUTBOUND
# Source: Discord official application and media domains (official-owned-domains)
# Normalized source domain count: 4
# Each base domain has a firewall FQDN seed plus a DNS regex learner in the same address-list
# do-not-edit-manually

/ip firewall address-list
remove [find list=DST-DISCORD-TO-OUTBOUND]
:do { add list=DST-DISCORD-TO-OUTBOUND address="discord.com" comment="discord:seed:discord.com" } on-error={}
:do { add list=DST-DISCORD-TO-OUTBOUND address="discord.gg" comment="discord:seed:discord.gg" } on-error={}
:do { add list=DST-DISCORD-TO-OUTBOUND address="discordapp.com" comment="discord:seed:discordapp.com" } on-error={}
:do { add list=DST-DISCORD-TO-OUTBOUND address="discordapp.net" comment="discord:seed:discordapp.net" } on-error={}

/ip dns static
remove [find address-list=DST-DISCORD-TO-OUTBOUND]
:do { add regexp="(^|.*\\.)discord\\.com$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:dns:discord.com" } on-error={}
:do { add regexp="(^|.*\\.)discord\\.gg$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:dns:discord.gg" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.com$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:dns:discordapp.com" } on-error={}
:do { add regexp="(^|.*\\.)discordapp\\.net$" type=FWD address-list=DST-DISCORD-TO-OUTBOUND comment="discord:dns:discordapp.net" } on-error={}
