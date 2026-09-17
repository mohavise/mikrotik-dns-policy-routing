# Samsung Galaxy Store Sources

## Official Sources

- Samsung Knox Documentation: [What URLs do I have to add to an allowlist to make Samsung apps work with an authenticated proxy?](https://docs.samsungknox.com/admin/knox-platform-for-enterprise/kbas/kba-115012547907/)
- Samsung Knox Documentation: [Samsung Knox firewall exceptions](https://docs.samsungknox.com/admin/knox-admin-portal/get-started/samsung-knox-firewall-exceptions/)

## Scope

This service is limited to Samsung Galaxy Store / Samsung Apps app listing, update, APK download, and related Samsung Apps CDN endpoints.

This service does not include Samsung Knox cloud services, Samsung device management, generic Samsung account routing, AWS, Firebase, or other cloud/CDN providers as standalone services.

Wildcard hosts from Samsung documentation are normalized to base domains in `domains.txt`; generated MikroTik DNS rules use plain `name=` entries with `match-subdomain=yes`, and redundant child domains are omitted when their parent domain is present.
