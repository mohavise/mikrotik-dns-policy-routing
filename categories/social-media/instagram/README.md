# Instagram for MikroTik

Install only the **Instagram** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-INSTAGRAM-TO-OUTBOUND` |
| Update script | `update-instagram-outbound` |
| Daily scheduler | `update-instagram-outbound` |
| Installer | `safe-install/social-media/instagram/safe-install-instagram-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/social-media/instagram/safe-install-instagram-outbound.rsc" dst-path=safe-install-instagram-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-instagram-outbound.rsc
/file remove [find name=safe-install-instagram-outbound.rsc]
```

The installer downloads the managed updater and scheduler, installs them without duplicates, and runs the first update.

## Requirements

Clients must use the MikroTik router for DNS so DNS Static FWD rules can learn destination IP addresses:

```routeros
/ip dns set allow-remote-requests=yes
```

Prevent client DNS bypass separately when required by your network design.

## Verify

```routeros
/ip dns static print where address-list=DST-INSTAGRAM-TO-OUTBOUND
/ip firewall address-list print where list=DST-INSTAGRAM-TO-OUTBOUND
/system script print where name=update-instagram-outbound
/system scheduler print where name=update-instagram-outbound
```

Run an update manually:

```routeros
/system script run update-instagram-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-INSTAGRAM-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Instagram to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-instagram-outbound]
/system script remove [find name=update-instagram-outbound]
/ip dns static remove [find address-list=DST-INSTAGRAM-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-INSTAGRAM-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-INSTAGRAM-TO-OUTBOUND`; use a separate custom address list.
