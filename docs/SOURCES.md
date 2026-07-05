# Source Policy

Use the most reliable source available for each service.

Preferred source order:

1. official service owner source
2. official service owner documentation
3. official service owner GitHub repository
4. mature community-maintained list with public history
5. local manual addition with a short reason

Do not copy domains or CIDR ranges into groups or profiles. Real data belongs in `services/<service>/database/`.

Each service should document its sources in:

```text
services/<service>/database/sources.md
```

Manual additions should go into:

```text
services/<service>/database/manual-domains.txt
services/<service>/database/manual-cidr.txt
```

Manual additions should stay empty unless the value is verified and missing from the selected upstream source.

