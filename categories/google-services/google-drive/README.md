# Google Drive for MikroTik

Install only the **Google Drive** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-GOOGLE-DRIVE-TO-OUTBOUND` |
| Update script | `update-google-drive-outbound` |
| Daily scheduler | `update-google-drive-outbound` |
| Installer | `safe-install/google-services/google-drive/safe-install-google-drive-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/google-services/google-drive/safe-install-google-drive-outbound.rsc" dst-path=safe-install-google-drive-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-google-drive-outbound.rsc
/file remove [find name=safe-install-google-drive-outbound.rsc]
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
/ip dns static print where address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND
/ip firewall address-list print where list=DST-GOOGLE-DRIVE-TO-OUTBOUND
/system script print where name=update-google-drive-outbound
/system scheduler print where name=update-google-drive-outbound
```

Run an update manually:

```routeros
/system script run update-google-drive-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Google Drive to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-google-drive-outbound]
/system script remove [find name=update-google-drive-outbound]
/ip dns static remove [find address-list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-GOOGLE-DRIVE-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-GOOGLE-DRIVE-TO-OUTBOUND`; use a separate custom address list.
