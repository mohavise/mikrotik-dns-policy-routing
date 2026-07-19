# OpenAI for MikroTik

Install only the **OpenAI** destination list.

| Item | Value |
| --- | --- |
| RouterOS address list | `DST-OPENAI-TO-OUTBOUND` |
| Update script | `update-openai-outbound` |
| Daily scheduler | `update-openai-outbound` |
| Installer | `safe-install/ai/openai/safe-install-openai-outbound.rsc` |

## Install

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/ai/openai/safe-install-openai-outbound.rsc" dst-path=safe-install-openai-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-openai-outbound.rsc
/file remove [find name=safe-install-openai-outbound.rsc]
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
/ip dns static print where address-list=DST-OPENAI-TO-OUTBOUND
/ip firewall address-list print where list=DST-OPENAI-TO-OUTBOUND
/system script print where name=update-openai-outbound
/system scheduler print where name=update-openai-outbound
```

Run an update manually:

```routeros
/system script run update-openai-outbound
```

## Use for policy routing

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-OPENAI-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="OpenAI to outbound"
```

Create the routing table and default route separately for your VPN, Xray, WireGuard, proxy gateway, or secondary WAN.

## Remove

```routeros
/system scheduler remove [find name=update-openai-outbound]
/system script remove [find name=update-openai-outbound]
/ip dns static remove [find address-list=DST-OPENAI-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-OPENAI-TO-OUTBOUND]
```

Do not manually add custom entries to `DST-OPENAI-TO-OUTBOUND`; use a separate custom address list.
