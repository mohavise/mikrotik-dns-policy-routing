# IP Detection for MikroTik

Install only the **IP Detection** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `IP-DETECTION` |
| Update script | `update-ip-detection-outbound` |
| Daily scheduler | `update-ip-detection-outbound` |
| Installer | `safe-install/network-tools/ip-detection/safe-install-ip-detection-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/network-tools/ip-detection/safe-install-ip-detection-outbound.rsc" dst-path=safe-install-ip-detection-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-ip-detection-outbound.rsc
/file remove [find name=safe-install-ip-detection-outbound.rsc]
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
/ip dns static print where address-list=IP-DETECTION
/ip firewall address-list print where list=IP-DETECTION
/system script print where name=update-ip-detection-outbound
/system scheduler print where name=update-ip-detection-outbound
```

Run an update manually:

```routeros
/system script run update-ip-detection-outbound
```

## Use for policy routing

Example only:

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=IP-DETECTION action=mark-routing new-routing-mark=to-outbound passthrough=no comment="IP Detection to outbound"
```

Create the routing table and default route separately for your own VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-ip-detection-outbound]
/system script remove [find name=update-ip-detection-outbound]
/ip dns static remove [find address-list=IP-DETECTION]
/ip firewall address-list remove [find list=IP-DETECTION]
```

Do not manually add custom entries to `IP-DETECTION`; use a separate custom address list.
