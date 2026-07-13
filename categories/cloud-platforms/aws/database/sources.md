# Amazon Web Services Sources

Official sources:

- https://aws.amazon.com/
- https://docs.aws.amazon.com/signin/latest/userguide/allowlist-domains.html
- https://docs.aws.amazon.com/awsconsolehelpdocs/latest/gsg/what-is.html

Scope is limited to AWS-owned website, documentation, console, sign-in, static console assets, and the specifically documented sign-in CAPTCHA hostname.

Generic `amazonaws.com`, `cloudfront.net`, public AWS IP ranges, and customer workload endpoints are intentionally excluded. The one `amazonaws.com` hostname in `domains.txt` is the exact AWS-documented sign-in CAPTCHA endpoint, not the parent domain.
