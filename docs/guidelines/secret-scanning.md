# Secret Scanning

> As developers, we know that secrets like passwords, API keys, and access tokens are critical to our work. But what happens when these secrets accidentally end up in our code, logs or error messages?

This guideline aims to present relevant tools, some good practices for managing this risk, and what to do when we have messed up. The AppSec team provides a 3 hour hands-on workshop on getting started with secret scanning - [https://github.com/equinor/appsec-fundamentals-secret-scanning](https://github.com/equinor/appsec-fundamentals-secret-scanning).

- [Recommended tools](#recommended-tools)
- [Where to scan for secrets in our SDLC](#where-to-scan-for-secrets-in-our-sdlc)
- [What to do when we have messed up 🤯](#what-to-do-when-we-have-messed-up)
- [How do we manage secrets in our dev environments?](#how-do-we-manage-secrets-in-our-dev-environments)

## Recommended tools

- [Snyk Code](https://docs.snyk.io/scan-using-snyk/snyk-code/scan-code) (in IDE)
- [Trufflehog](https://github.com/trufflesecurity/trufflehog) (elsewhere)
- [GitHub Advanced Security - Secret Scanning](#github-advanced-security-secret-scanning)

Please note that:

- False positives is a sizeable challenge, scanners need to be fine tuned to your context (detectors, testing, verification +++)
- Incremental scans would be helpful, you may not want to scan everything all the time
- Don't underestimate the cultural change when changing how you work. Good practices are to document how your team does Secure Development and to threat model how you work. Use/revisit this information regularly in on-boarding of new team members and in retrospectives.

(Check out the [appsec tools section](../resources/tools.md) for more tooling)

### GitHub Advanced Security: Secret Scanning

!!! info
    The "Secret Scanning" feature of GitHub Advanced Security is currently not enabled for "Internal" or "Private" repositories within Equinor. It is available only for "Public" repositories.

GitHub Advanced Security is integrated into GitHub, providing features like the secret scanning module free for public repositories. This module supports these [secret types](https://docs.github.com/en/code-security/secret-scanning/secret-scanning-patterns#supported-secrets) so far.

#### How to turn it on for your repository

- Go to your repository settings
- Under security find Code security and analysis
- Enable secret scanning. 
- Consider enabling push protection for added security.

#### Global push protection

GitHub provides a **beta feature** that will prevent pushes from you that contain [supported secrets](https://docs.github.com/en/code-security/secret-scanning/secret-scanning-patterns#supported-secrets) across all public repositories.

- Enable by going to your user settings, code security and analysis and enable the beta feature push protection for yourself.
- *Note that this is an experimental feature*

## Where to scan for secrets in our SDLC

The general idea is to catch secrets in code (and other places) as early as possible. Our recommendation for most teams is:

While your are developing, in your development environment

- Scan in your IDE (using Snyk Code)
- Scan in your local build process (using Trufflehog)
- Scan in git [pre-commits](FAQ/pre-commit-faq.md) (Run a trufflehog scan on commit for example?)

In your CI pipeline

- Scan as part of PR checks (using Trufflehog)
- Scan container images as well (using Trufflehog)

Other places:

- Scanning logs (using Trufflehog)

## 🤯 What to do when we have messed up 🤯

We will mess up sooner or later. So be prepared, both as an individual developer and as teams!

### Steps to mitigate a leak

- Revoke/rotate the exposed secret - `THIS IS PRIORITY #1`
- Depending on risk consequence - considering contacting IT-Security for assistance
    - Contact Help Desk at (+47) 51 999 222
- Clean the git history
    - If the repo is public/internal, consider making it `private` until the secrets are removed
- Potentially inspect logs
- Do a retrospective with your team

### Cleaning the git history

This part can be very easy to super hard, it all depends on what, where and when.

#### You are working locally, the secret is in the last commit, not pushed

- The secret is the only file in the last commit
    - Consider dropping the last commit, doing a `git reset --hard HEAD~1`
- The secret is not the only file in the last commit
    - Consider altering files and then amend the last commit
    - `git add [files]; git commit --amend`

#### You are working locally, the secret is beyond the last commit

Then things could get complicated. Git is distributed, you are not on your own. Rewriting the history could lead to all sorts of issues

Explore:

- [git-filter-repo](https://htmlpreview.github.io/?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html)
- the [bfg repo-cleaner](https://rtyley.github.io/bfg-repo-cleaner/)

You'll also find some guidelines in the github.com [docs](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository)

Be aware of:

- You may need to coordinate with your team
- Force push is powerful, use carefully
- Do a backup before you mess things up even more!

## How do we manage secrets in our dev environments?

Context matters, a lot. There are many different ways of handling secrets in development environments. The opportunities will depend on the context. We will always have to find a good balance between security and convenience.

### A few *known* ways of managing secrets is

- Using password/credential managers
- Using keychain services
- Storing secrets in encrypted files
- Storing secrets in .env files
- Storing secrets in secret management tools (like Azure Key Vault)
- Injecting secrets into environment variables

### A few *known* controls could be

- Using .gitignore
- Using .dockerignore
- Using secret scanners
  - Not all tools are equal
- Limit access to secrets
- Use different secrets for different environments (dev, test, prod)
- Rotate secrets often, automate!
- Auditing and logging
- Keep secrets out of command history
- Educating and training are smart
- `Threat modelling your SDLC with your team is even smarter!`

### What we should NOT do

- Don't hardcode secrets into code
- Don't store secrets as part of the code (not even encrypted)
- Don't emit secrets into logs
- Don't put secrets in emails
- Don't share secrets in Slack channels
