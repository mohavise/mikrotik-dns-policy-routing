# Google Play Sources

## Official Sources

- Google Support: [Android Enterprise Network Requirements](https://support.google.com/work/android/answer/10513641)
- Google Support: [Access to Managed Google Play](https://support.google.com/googleplay/work/answer/7042221)

## Scope

This service uses official Google endpoints for Google Play, app downloads and updates, Play Store APIs, Managed Google Play console access, authentication, certificate validation, and Firebase/Google Cloud Messaging endpoints used by Android Enterprise and managed Google Play.

Wildcard hosts from Google documentation are normalized to base domains in `domains.txt`; MikroTik output converts them to RouterOS-compatible regex rules.

Google does not provide stable service-specific IP ranges for these endpoints, so `manual-cidr.txt` is intentionally empty.
