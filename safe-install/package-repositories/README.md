# Package Repositories Safe Installers

Safe installer entry points for the `package-repositories` category.

## Category profile

Import this file when you want one combined package repository list:

```routeros
/import file-name=safe-install-package-repositories-to-outbound.rsc
```

It installs and runs:

```text
update-package-repositories-outbound
DST-PACKAGE-REPOSITORIES-TO-OUTBOUND
```

The category profile combines:

```text
ubuntu
debian
redhat
proxmox
docker
```

## Service installers

Use these only when you want one package repository service instead of the full category:

```text
debian/safe-install-debian-outbound.rsc
docker/safe-install-docker-outbound.rsc
proxmox/safe-install-proxmox-outbound.rsc
redhat/safe-install-redhat-outbound.rsc
ubuntu/safe-install-ubuntu-outbound.rsc
```

## Primary profile

The primary safe installer already includes this category through `package-repositories-to-outbound`, so importing the primary profile also refreshes package repository destinations.
