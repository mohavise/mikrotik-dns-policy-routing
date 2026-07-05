# Service Database

This directory is the source database for generated MikroTik policy-routing lists.

Each service gets its own directory:

```text
database/services/<service-id>/
```

The repository keeps two layers separate:

- database files: trusted sources, local additions, and service metadata
- root `.rsc` files: generated MikroTik import files for users

## Source Rules

Use the most reliable source available for each data type.

Preferred source order:

1. official service provider source
2. mature community-maintained list with public history
3. local manual additions with a short reason

Generated files must not be edited manually. Add fixes to the service database, then regenerate.

## MikroTik Output Model

Each service should be able to generate:

```text
list-<service>-domains.rsc
list-<service>-cidr.rsc
list-<service>-all.rsc
```

The root output files stay easy to fetch from MikroTik.

