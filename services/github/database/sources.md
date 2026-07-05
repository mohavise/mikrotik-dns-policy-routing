# GitHub Sources

## Domains

Source:

```text
https://docs.github.com/en/rest/meta/meta
https://api.github.com/meta
```

Reason:

```text
GitHub documents a meta endpoint for current GitHub domain and IP metadata. This service keeps conservative GitHub-owned domains in the local database and avoids broad shared-provider ranges.
```

## CIDR

```text
none
```

Reason:

```text
GitHub publishes official IP metadata through https://api.github.com/meta, but this first version does not import CIDR ranges into MikroTik because ranges can affect broad infrastructure behavior. CIDR can be added later with category-specific rules.
```

