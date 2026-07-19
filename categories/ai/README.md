# Ai Category for MikroTik

Install the complete **Ai** category as one managed destination list.

| Item | Value |
| --- | --- |
| Category address list | `DST-AI-TO-OUTBOUND` |
| Update script | `update-ai-to-outbound` |
| Daily scheduler | `update-ai-to-outbound` |
| Installer | `safe-install/ai/safe-install-ai-to-outbound.rsc` |

## Install the complete category

```routeros
/tool fetch url="https://raw.githubusercontent.com/mohavise/mikrotik-dns-policy-routing/main/safe-install/ai/safe-install-ai-to-outbound.rsc" dst-path=safe-install-ai-to-outbound.rsc check-certificate=yes-without-crl
/import file-name=safe-install-ai-to-outbound.rsc
/file remove [find name=safe-install-ai-to-outbound.rsc]
```

## Included services

| Service | Individual list |
| --- | --- |
| [OpenAI](./openai/) | `DST-OPENAI-TO-OUTBOUND` |

To install only one service, open that service folder and use its own README.

## Requirements

```routeros
/ip dns set allow-remote-requests=yes
```

Clients must use the MikroTik router for DNS. DNS bypass prevention is a separate firewall design decision.

## Verify

```routeros
/ip dns static print where address-list=DST-AI-TO-OUTBOUND
/ip firewall address-list print where list=DST-AI-TO-OUTBOUND
/system script print where name=update-ai-to-outbound
/system scheduler print where name=update-ai-to-outbound
```

Run an update manually:

```routeros
/system script run update-ai-to-outbound
```

## Policy-routing example

```routeros
/ip firewall mangle add chain=prerouting dst-address-list=DST-AI-TO-OUTBOUND action=mark-routing new-routing-mark=to-outbound passthrough=no comment="Ai to outbound"
```

## Remove

```routeros
/system scheduler remove [find name=update-ai-to-outbound]
/system script remove [find name=update-ai-to-outbound]
/ip dns static remove [find address-list=DST-AI-TO-OUTBOUND]
/ip firewall address-list remove [find list=DST-AI-TO-OUTBOUND]
```

Do not manually add entries to the managed category list. Use a separate custom list.
