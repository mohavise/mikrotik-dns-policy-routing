# Facebook for MikroTik

Install only the **Facebook** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-FACEBOOK-TO-OUTBOUND` |
| Update script | `update-facebook-outbound` |
| Daily scheduler | `update-facebook-outbound` |
| Installer | `safe-install/social-media/facebook/safe-install-facebook-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/social-media/facebook/safe-install-facebook-outbound.rsc" dst-path=safe-install-facebook-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-facebook-outbound.rsc
/file remove [find name=safe-install-facebook-outbound.rsc]
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
/ip dns static print where address-list=DST-FACEBOOK-TO-OUTBOUND
/ip firewall address-list print where list=DST-FACEBOOK-TO-OUTBOUND
/system script print where name=update-facebook-outbound
/system scheduler print where name=update-facebook-outbound
```

Run an update manually:

```routeros
/system script run update-facebook-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-FACEBOOK-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Facebook to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-facebook-outbound]
/system script remove [find name=update-facebook-outbound]
/ip dns static remove [find address-list=DST-FACEBOOK-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-FACEBOOK-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-FACEBOOK-TO-OUTBOUND`; use a separate custom address list.
