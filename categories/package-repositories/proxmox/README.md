# Proxmox for MikroTik

Install only the **Proxmox** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-PROXMOX-TO-OUTBOUND` |
| Update script | `update-proxmox-outbound` |
| Daily scheduler | `update-proxmox-outbound` |
| Installer | `safe-install/package-repositories/proxmox/safe-install-proxmox-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/package-repositories/proxmox/safe-install-proxmox-outbound.rsc" dst-path=safe-install-proxmox-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-proxmox-outbound.rsc
/file remove [find name=safe-install-proxmox-outbound.rsc]
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
/ip dns static print where address-list=DST-PROXMOX-TO-OUTBOUND
/ip firewall address-list print where list=DST-PROXMOX-TO-OUTBOUND
/system script print where name=update-proxmox-outbound
/system scheduler print where name=update-proxmox-outbound
```

Run an update manually:

```routeros
/system script run update-proxmox-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-PROXMOX-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Proxmox to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-proxmox-outbound]
/system script remove [find name=update-proxmox-outbound]
/ip dns static remove [find address-list=DST-PROXMOX-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-PROXMOX-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-PROXMOX-TO-OUTBOUND`; use a separate custom address list.
