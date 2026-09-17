# managed-by=mohavise-mikrotik-dns-policy-routing
# project=mikrotik-dns-policy-routing
# service=discord
# List: Discord domains
# RouterOS address-list: DST-DISCORD-TO-OUTBOUND
# Source: Discord official application and media domains (official-owned-domains)
# Normalized source domain count: 4
# Service dependencies are reduced to base parent domains and matched with match-subdomain=yes
# do-not-edit-manually

/ip dns static
remove [find address-list=DST-DISCORD-TO-OUTBOUND]
:do { add name="discord.com" type=FWD match-subdomain=yes address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discord.com" } on-error={}
:do { add name="discord.gg" type=FWD match-subdomain=yes address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discord.gg" } on-error={}
:do { add name="discordapp.com" type=FWD match-subdomain=yes address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discordapp.com" } on-error={}
:do { add name="discordapp.net" type=FWD match-subdomain=yes address-list=DST-DISCORD-TO-OUTBOUND comment="discord:discordapp.net" } on-error={}
