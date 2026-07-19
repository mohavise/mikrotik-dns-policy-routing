# Speedtest for MikroTik

Install only the **Speedtest** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `SPEEDTEST` |
| Update script | `update-speedtest-outbound` |
| Daily scheduler | `update-speedtest-outbound` |
| Installer | `safe-install/network-tools/speedtest/safe-install-speedtest-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/network-tools/speedtest/safe-install-speedtest-outbound.rsc" dst-path=safe-install-speedtest-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-speedtest-outbound.rsc
/file remove [find name=safe-install-speedtest-outbound.rsc]
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
/ip dns static print where address-list=SPEEDTEST
/ip firewall address-list print where list=SPEEDTEST
/system script print where name=update-speedtest-outbound
/system scheduler print where name=update-speedtest-outbound
```

Run an update manually:

```routeros
/system script run update-speedtest-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=SPEEDTEST action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Speedtest to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-speedtest-outbound]
/system script remove [find name=update-speedtest-outbound]
/ip dns static remove [find address-list=SPEEDTEST]
/ip firewall address-list remove [find list=SPEEDTEST]
```

Do not manually add custom entries to `SPEEDTEST`; use a separate custom address list.
