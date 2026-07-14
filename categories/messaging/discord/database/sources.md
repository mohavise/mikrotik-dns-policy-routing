# Discord Sources

Official sources:

- https://support.discord.com/hc/en-us/articles/360042987951-Discordapp-com-is-now-Discord-com
- https://docs.discord.com/developers/reference
- https://support.discord.com/hc/en-us/articles/360034842871-How-do-I-join-a-Server
- https://support.discord.com/hc/en-us/articles/115001310031-Voice-Connection-Errors

The list covers Discord's application and API (`discord.com`), server invites (`discord.gg`), legacy application/CDN compatibility (`discordapp.com`), and media proxy/CDN delivery (`discordapp.net`).

Discord voice uses dynamic real-time endpoints. Domain routing covers discovery and application traffic, but voice connectivity also requires the selected outbound path to support UDP. Shared infrastructure and unrelated third-party domains are intentionally excluded.
