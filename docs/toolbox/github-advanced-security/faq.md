# GHAS Transition FAQ

## Can we enable GHAS now?

Yes - it is enabled by default for all repos by policy (secret scannning and security alerts)

## Is AppSec publishing some guidelines / best practices for enabling and configuring GHAS anytime soon?

Yes, we have published a [guide for enabling and configuring GHAS](../github-advanced-security/setup.md).

## Will there be an onboarding session?

We have scheduled five onboarding sessions in October, all Security Champions have been invited and you can request access in the [#appsec](https://equinor.enterprise.slack.com/archives/CMM6FSW5V) channel.

## Does GHAS settings get applied to forks of the repository?

When you fork a repository, Advanced Security features are not automatically enabled on the fork.
This is because security settings (such as code scanning, secret protection, etc.) are managed per repository,
and forking does not inherit these settings by default. 

If you want Advanced Security features in your fork, you need to enable them manually. 

We have also observed that pull requests to the upstream repository require that a successful CodeQL scan is performed on the fork. 

## Dependabot? CodeQL? What are these?

Dependabot will be your new best friend when it comes to dependency scanning while CodeQL will scan your code and make sure there are no code vulnerabilities.
Together they work to make your project as safe as it can be.

## What role do I need to enable GHAS?

From 1st of October, repository **admins** will be able to enable GHAS, we recommend taking a look at our [guide for enabling and configuring GHAS](../github-advanced-security/setup.md).

## What dashboards will I have access to? How can I see vulnerability trends?

With GHAS, you'll have access to the security tab in each repository, where you can view code scanning alerts, secret scanning results, and Dependabot insights (dependencies).

For broader visibility, the organization level security tab provides aggregated data across all repos you have access to. Here you can find an overview on alerts over time, security risks currently open and security coverage. You can also see all your Dependabot, code scanning and secret scanning alerts across all repos. The organization level security tab is available for repository **admins only**.

## Any general guidelines for container scanner?

We are currently evaluating open source alternatives like Trivy.
At the moment, there are no guidelines on container scanner but we are working on releasing some as soon as possible.

## Does GHAS support IaC scanning?

No, we are looking into open source alternatives, like Trivy, to support teams with scanning their IaC.
If you have any good experiences with an IaC open source tool, please let us know.

## Should I also enable GHAS for repositories that only contain documentation?

From 1st of October, all repositories in the Equinor organization should be onboarded into GHAS.
Repositories that only contain documentation can also contain secrets and GitHub actions, GHAS can help by detecting secrets in the repository and by scanning your GitHub actions for vulnerabilities or out of date versions.

## How can I get security alerts in slack?

This is unfortunately not something we have found an easy solution to. If you are aware of a method please reach out to your nearest AppSec representative!
We recommend setting up e-mail notifications in GitHub, you can filter GHAS specific e-mails to a separate folder by using for example the "security" keyword for filtering.
GHAS alerts will also be shown in your repository Security tab.

## What should I do to offboard from Snyk?

From 1st of October you can disable alerting in Snyk in order to not receive double alerting.
Once you have completed the migration onto GHAS you should revoke the PAT tokens that have been used with Snyk.

## Do you still recommending using Trufflehog?

Absolutely, Trufflehog can be automated to run during a pre-commit hook which will significantly reduce the chance that a secret is pushed, although GitHub has push-protection and high quality secret scanning capabilities. You can see the currently supported patterns by GHAS here: <https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#default-patterns>

## Should we have a custom Code Scanning setup?

The default code scanning should be good for most cases. It scans on every commit. You may monitor the consumption in minutes on Github Actions. If that number goes above 1000 minutes a month, then contact the AppSec team. They'll first try to take that consumption down by fine tuning CodeQL. And if that fails, only then we can consider weekly scans instead of every commit.

## Can I still use the Snyk VsCode extension after the decommission of Snyk?

As all the Orgs and projects currently in Snyk will be deleted, we recommend moving away from using the Snyk VsCode extension.
