# Google Cloud for MikroTik

Install only the **Google Cloud** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-GOOGLE-CLOUD-TO-OUTBOUND` |
| Update script | `update-google-cloud-outbound` |
| Daily scheduler | `update-google-cloud-outbound` |
| Installer | `safe-install/cloud-platforms/google-cloud/safe-install-google-cloud-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/cloud-platforms/google-cloud/safe-install-google-cloud-outbound.rsc" dst-path=safe-install-google-cloud-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-google-cloud-outbound.rsc
/file remove [find name=safe-install-google-cloud-outbound.rsc]
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
/ip dns static print where address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND
/ip firewall address-list print where list=DST-GOOGLE-CLOUD-TO-OUTBOUND
/system script print where name=update-google-cloud-outbound
/system scheduler print where name=update-google-cloud-outbound
```

Run an update manually:

```routeros
/system script run update-google-cloud-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Google Cloud to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-google-cloud-outbound]
/system script remove [find name=update-google-cloud-outbound]
/ip dns static remove [find address-list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-GOOGLE-CLOUD-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-GOOGLE-CLOUD-TO-OUTBOUND`; use a separate custom address list.
