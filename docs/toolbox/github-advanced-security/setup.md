
## What settings can I enable?

From 1st of October, under Repository Settings -> Security -> Advanced Security.

Under [**Secret Protection**](https://docs.github.com/en/code-security/secret-scanning/introduction/about-secret-scanning), everything can be enabled except for **Prevent direct alert dismissals**. When enabled, every **historical** commit, issue, pull request, dicussion, wiki or comment will be scanned for secrets.

[**Validity checks**](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets) option will verify if a secret is valid by sending it to a relevant party. e.g. if an Azure secret is detected it will be sent to Azure to verify if it is a valid Azure secret.

[**Non-provider patterns**](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#non-provider-patterns) will also look for patterns that do not belong to a provider e.g. Azure, these can be authentication tokens, connection strings, ssh keys... We recommend enabling this option.

The **Scan for generic passwords** option will try to detect passwords using AI, this may lead to a slightly higher number of false positives but may also provide better protection against secrets that do not follow a known pattern. Our recommendation is trying it out, if the noise becomes too much let us know and feel free to disable it.

Enabling **Push Protection** means that commits that may contain secrets will be blocked.
This means that your team members will be blocked from pushing commits that might contain secrets, even if they are false positives. The block can be bypassed but bypassing the block will generate an alert.
We recommend enabling [push protection](https://docs.github.com/en/code-security/secret-scanning/introduction/about-push-protection) but talk to your team that they might encounter this new behavior from now.

[**Prevent direct alert dismissals**](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/using-advanced-secret-scanning-and-push-protection-features/enabling-delegated-alert-dismissal-for-secret-scanning) enabling this means that your team members will have to submit a request to dismiss a secret alert. The request will then be reviewed by the Github Equinor Admins or the Security Managers. We do **not** recommend enabling this option, the AppSec team believes that it should be up to the teams to decide which alerts deserve their attention.

[Code Security](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-supply-chain-security) should be enabled.

**Dependancy Graph** must be enabled for Dependabot to work.

Under **Dependabot**, everything can also be enabled.
**Dependabot alerts** will generate pull requests that resolve your vulnerabilities. 