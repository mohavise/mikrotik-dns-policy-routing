# Music Category for MikroTik

Install the complete **Music** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-MUSIC-TO-OUTBOUND` |
| Update script | `update-music-to-outbound` |
| Daily scheduler | `update-music-to-outbound` |
| Installer | `safe-install/music/safe-install-music-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/music/safe-install-music-to-outbound.rsc" dst-path=safe-install-music-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-music-to-outbound.rsc
/file remove [find name=safe-install-music-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [Spotify](./spotify/) | `DST-SPOTIFY-TO-OUTBOUND` |

To install only one service, open that service folder and use its README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-MUSIC-TO-OUTBOUND
/ip firewall address-list print where list=DST-MUSIC-TO-OUTBOUND
/system script print where name=update-music-to-outbound
/system scheduler print where name=update-music-to-outbound
```

Run an update manually:

```routeros
/system script run update-music-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-MUSIC-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Music to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-music-to-outbound]
/system script remove [find name=update-music-to-outbound]
/ip dns static remove [find address-list=DST-MUSIC-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-MUSIC-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
