# GitHub Advanced Security Enablement and Setup

!!! info
    This guidance applies to repositories in the Equinor GitHub organization.

## Enabled by organization policy

GHAS is configured centrally. Teams do not need to enable the following features:

- **Secret Protection** is fully enabled by policy and cannot be turned off.
- **CodeQL** code scanning is enabled by policy.
- **Dependency graph and automatic dependency submission** are enabled by policy.
- **Dependabot** is enabled by policy, including alerts and security updates. Its managed settings are turned on; grouped security updates and version update configuration remain team choices.

If automatic dependency submission causes problems, such as failures when resolving dependencies from private registries, contact the AppSec team in [#appsec on Slack](https://equinor.enterprise.slack.com/archives/CMM6FSW5V).

## Options your team can configure

Repository admins can find the settings below under **Settings > Advanced Security**.

### Custom secret patterns

Repository admins can define custom patterns to detect application-specific secrets that GitHub's built-in patterns do not cover, such as internal tokens with a recognizable format.

Under **Secret Protection > Custom patterns**, select **New pattern**, define a regular expression, and test it with a dry run before publishing. Review the results for false positives.

Custom patterns are optional and supplement the organization-managed protection. See [Defining custom patterns for secret scanning](https://docs.github.com/en/code-security/how-tos/secure-your-secrets/customize-leak-detection/define-custom-patterns).

### Copilot Autofix

Your team can choose whether to enable **Copilot Autofix** under **Code Security**. It suggests fixes for supported code scanning alerts and does not require a separate GitHub Copilot subscription.

We recommend using it to help resolve alerts, but always review and test suggested changes before merging. A suggestion is not a guarantee that the vulnerability is fully resolved or that the code still behaves correctly.

See [Responsible use of GitHub's security AI features](https://docs.github.com/en/code-security/responsible-use/security-and-quality-ai-features).

### Grouped Dependabot security updates

Your team can enable or disable **Grouped security updates** in the Dependabot settings. Grouping combines security updates for the same package ecosystem into fewer pull requests.

Enable grouping to reduce pull request volume, or leave it disabled if your team prefers to review updates individually. Grouped updates can require more work to identify which dependency caused a regression.

For finer control, define security update groups in `.github/dependabot.yml`. See [Configuring Dependabot security updates](https://docs.github.com/en/code-security/how-tos/secure-your-supply-chain/secure-your-dependencies/configure-security-updates#grouping-dependabot-security-updates-into-a-single-pull-request).

### Dependabot version updates

Version updates keep dependencies current even when no known vulnerability exists. Your team configures these updates in `.github/dependabot.yml`; organization-managed Dependabot settings do not replace this repository configuration.

Choose the package ecosystems and manifest directories to maintain, how often Dependabot checks for updates, and how updates are grouped. You can also set an open pull request limit to keep the workload manageable. Include the `github-actions` ecosystem to keep workflow dependencies up to date.

We recommend configuring version updates and agreeing on a process for reviewing the resulting pull requests. See [Configuring Dependabot version updates](https://docs.github.com/en/code-security/how-tos/secure-your-supply-chain/secure-your-dependencies/configure-version-updates).

## Help

For configuration advice, CodeQL failures, or dependency submission issues, contact the AppSec team in [#appsec on Slack](https://equinor.enterprise.slack.com/archives/CMM6FSW5V).
