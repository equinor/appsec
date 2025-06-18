
# GitHub Advanced Security Enablement and Setup

>[!IMPORTANT]
>Internal and Private Repositories must wait until 1st of October before enabling GHAS.

> [!NOTE]
> You must be a repository Admin to procceed

Navigate to your repository and under Settings -> Security -> Advanced Security.

![Navigation to GHAS](<Screenshot 2025-06-12 at 14.32.53.png>)

Bellow you can find a table summary of the options we recommend to enable:

| **Feature**                           | **Options**                                       | **Recommendation** |
|---------------------------------------|---------------------------------------------------|--------------------|
| Secret Scanning                       |                                                   | Yes                |
|                                       | Validity Checks                                   | Optional           |
|                                       | Non-provider Patterns                             | Yes                |
|                                       | Scan for Generic Passwords                        | Yes                |
|                                       | Push-Protection                                   | Yes                |
|                                       | Who can bypass push protection                                          | Anyone unless limited to certain members. |
|                                       | Prevent Alert Dismissal                           | No                 |
| Code Security                         |                                                   | Yes                |
|                                       | Set Up                                            | Default setup      |
|                                       | Copilot Autofix                                   | Yes                |
|                                       | Copilot Autofix for Third Party Tools             | Yes                |
|                                       | Prevent Direct Alert Dismissal                    | No                 |
| Dependency Graph                      |                                                   | Yes                |
|                                       | Dependabot Alerts                                 | Yes                |
|                                       | Dependabot Security Updates                       | Yes                |
|                                       | Grouped Security Updates                          | Optional           |
|                                       | Dependabot Version Updates                        | Optional           |
|                                       | Dependabot on Action Runners                      | Optional           |
|                                       | Dependabot on Self-hosted Runners                 | No                 |


## [Secret Protection](https://docs.github.com/en/code-security/secret-scanning/introduction/about-secret-scanning)

![Secret Protection Options](<Screenshot 2025-06-12 at 14.28.28.png>)

(1) Enabling Secret Protection will enable secret scanning on the repository. Upon enabling github will start scanning the whole **history** of the repository for secrets, this scan will include commits, pull requests, issues, comments, discussions and wikis. <br/>
This option should be enabled.
<br/><br/>
(2) [Validity checks](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets) enhances secret scanning by verifying whether a detected secret is actually valid. When enabled, GitHub forwards the detected secret to the relevant provider (for example, an Azure secret would be sent to Microsoft) to confirm if it's active. Enabling this feature provides teams with insight into whether a secret is live and exploitable. However, it's important to note that the third party may, in the future, automatically revoke or disable the secret once its validity is confirmed. For instance, if Azure confirms a secret is active, it might proactively disable it to prevent abuse. <br/>
The enablement of this option should be decided by the team.
<br/><br/>
(3) [Non-provider patterns](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#non-provider-patterns) improves secret scanning coverage by also detecting secrets that don't belong to a specific provider (like Azure or AWS). This includes things like custom authentication tokens, connection strings, SSH keys, and other credentials. <br/>
We recommend enabling this option to catch a broader range of exposed secrets—not just those tied to known providers.
<br/><br/>
(4) [Scan for generic passwords](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/copilot-secret-scanning/responsible-ai-generic-secrets) uses Copilot AI to identify passwords that don’t follow standard or known patterns. This helps catch secrets that might otherwise go undetected—but it can also lead to a slightly higher number of false positives. <br/>
We recommend giving this option a try. If it generates too much noise or becomes disruptive, let us know and feel free to disable it.
<br/><br/>
(5) [Push Protection](https://docs.github.com/en/code-security/secret-scanning/introduction/about-push-protection) scans commits for [supported secrets](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets) and blocks them before they’re pushed to a remote branch. This helps stop secrets from ever reaching the repository history, making cleanup easier or even unnecessary. <br/>
Pushes are only blocked if GitHub is very confident that the detected string is a valid secret from a known provider (like Azure, AWS, etc.). It does not block on non-provider patterns or generic passwords detected by AI to keep false positives low. <br/>
That said, developers will see push failures when secrets are detected even if they’re false positives, some errors may be a bit hard to figure out and might require digging into logs, so it’s important to prepare your team for this behavior. The alerts can be bypassed (6). <br/>
We recommend enabling Push Protection to prevent secrets at the source. But make sure your team is aware of the tradeoff: it may occasionally block a push, but it’s far less painful than cleaning up leaked secrets later.
<br/><br/>
(6) Who can bypass push protection for secret scanning, this option is only available when push protection (5) is enabled and it configures who is allowed to bypass the block if a secret is detected. By default, GitHub allows anyone with write access to bypass the rule and this works well for most teams. If your team prefers tighter control, you can restrict bypass permissions to specific roles or individuals.
<br/><br/>
(7) [Prevent direct alert dismissals](https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/using-advanced-secret-scanning-and-push-protection-features/enabling-delegated-alert-dismissal-for-secret-scanning) setting requires teams to submit a request before they can dismiss a secret scanning alert. These requests must then be reviewed and approved by the AppSec Team. <br/>
We do not recommend enabling this option. The AppSec team believes that teams are in the best position to assess alerts in their context and should have the autonomy to manage them.
<br/><br/>
(8) Custom Patterns lets you define your own regex rules to detect secrets specific to your team or application, things GitHub doesn’t catch by default, this can be useful for internal tokens, credentials, or configuration values that follow a custom format. <br/>
It takes a bit of effort to set up, and we don’t expect most teams will need it. But if you think this could be useful for your setup, let us know and we will be happy to help you configure it.

## [Code Security](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-supply-chain-security)

![Code Security Options](<Screenshot 2025-06-12 at 15.20.32.png>)

(1) Code Security is GitHub’s Static Application Security Testing (SAST) tool also known as CodeQL, which runs via GitHub Actions to scan your repository for security issues in the code.<br/>
The setup may vary depending on the language and ecosystem, some will work out of the box, while others may require configuring a workflow file in the repo. Once enabled, it continuously scans code for common vulnerabilities.<br/>
Code Security should be enabled.
<br/><br/>
(2) CodeQL Analysis must be configured for code security to work. Once enabled a GitHub action will run to scan your code automatically.
We recommend choosing the default setup, which works well for most repositories and languages.
<br/><br/>
(3) Other Tools enables you to integrate other code scanning tools.<br/>
We don't expect most teams to need this but if you think this would be useful, let us know so we can help you configure it.
<br/><br/>
(4) Copilot Autofix allows Copilot to automatically generate a pull request to fix vulnerabilities identified by CodeQL. When enabled, you’ll see suggested fixes, and you can choose to let Copilot create a PR with the proposed changes.<br/>
It’s a helpful way to quickly address straight forward issues but we always recommend to review the fix before merging.<br/>
We recommend enabling this option.
<br/><br/>
(5) Copilot Autofix for third-party tools, Copilot Autofix also works with third-party security tools, not just CodeQL.<br/>
We recommend enabling this option.
<br/><br/>
(6) Prevent direct alert dismissals, if enabled, any attempt to dismiss a CodeQL alert will trigger a review request that’s sent to the AppSec team. This adds unnecessary overhead and delays. We believe teams should be trusted to manage and triage their own alerts based on what makes sense in their context.<br/>
We do not recommend enabling this setting.
<br/><br/>
(7) Protection rules allows you to set a check runs failure threshold to control when code scanning should block a pull request.
You can choose the alert severity level that will cause the Code Scanning check to fail. Combined with a branch ruleset, this allows you to prevent merges to protected branches when these severity level issues are detected.<br/>
The recommended set up should be good for most teams, let us know if you need help setting up a more advanced ruleset.
<br/><br/>
(8) Private vulnerability reporting is only available for public repositories, it provides a standardized and secure way for the community to report security vulnerabilities directly to the maintainers of the repository.<br/>
Enablement should be a team decision, consider how you plan to respond to incoming reports if enabled.

## [Dependency Graph](https://docs.github.com/en/code-security/supply-chain-security/understanding-your-software-supply-chain/about-the-dependency-graph)

![Depdency graph options](<Screenshot 2025-06-12 at 17.04.57.png>)

(1) Dependency Graph must be enabled to use Dependabot, this allows GitHub to upload your dependencies and scan them for known vulnerabilities
For this to work, your repository must include a .lock or manifest file. In some ecosystems, like .NET, you may need to run a dotnet restore (more guidance on this will come) to generate the required files.<br/>
Dependency Graph should be enabled.
<br/><br/>
(2) Automatic dependency submission allows GitHub to detect and report dependencies automatically. It helps keep your Dependency Graph up to date without manual intervention.<br/>
Enable with the default settings.
<br/><br/>
(3) Dependabot alerts notify you when vulnerabilities are found in your dependencies. Alerts will appear in the GitHub UI under the Security Dashboard, and can also be sent by email.<br/>
Note: Slack notifications are not available with GHAS. We recommend setting up email notifications or configuring GitHub notification rules to make sure your team stays up to date on security issues.<br/>
We recommend enabling this option.
<br/><br/>
(4) Dependabot security updates will automatically create pull requests to upgrade dependencies to safe, non-vulnerable versions.<br/>
We recommend enabling this option.
<br/>
(5) Grouped security updates allows Dependabot to combine multiple security updates into a single pull request. This helps reduce the number or PRs but might require moer thorough testing to ensure the combined upgrades do not break existing functionality.<br/>
The enablement of this option is up to the team.
<br/><br/>
(6) Dependabot version updates allows Dependabot to open pull requests to keep your dependencies up to date, even if there are no known vulnerabilities. This helps reduce technical debt and makes it easier to stay updated to the latest versions.<br/>
The enablement of this option is up to the team.
<br/><br/>
(7) Dependabot on Actions runners enables Dependabot to create pull requests suggesting security and version updates for your GitHub Actions workflows.<br/>
The enablement of this option is up to the team.
<br/><br/>
If you have any futher questions please reach out to us on the [#appsec](https://equinor.enterprise.slack.com/archives/CMM6FSW5V) slack.