# GHAS Transition FAQ

## Can we enable GHAS now?

No. Unless your repository is public, or we have gotten in touch with your team, there are no available licences until 1st of October.

## Is AppSec publishing some guidelines / best practices for enabling and configuring GHAS anytime soon?

Yes, all relevant guidelines and best practices will be available here soon!  

## What dashboards will I have access to? How can I see vulnerability trends?

With GHAS, you'll have access to the security tab in each repository, where you can view code scanning alerts, secret scanning results, and Dependabot insights (dependencies).

For broader visibility, the organization level security tab provides aggregated data across all repos you have access to. Here you can find an overview on alerts over time, security risks currently open and security coverage. You can also see all your Dependabot, code scanning and secret scanning alerts across all repos.

## Any general guidelines for container scanner?

We are currently evaluating open source alternatives like Trivy.
At the moment, there are no guidelines on container scanner but we are working on releasing some as soon as possible.

## Will there be an onboarding session?

We are planning on having a few open sessions in October to assist with setting up GHAS. In most cases the documentation should be sufficient. We will also have some guided setup sessions where we show our recommended setup. We will announce these sessions at a later time.

## How can I get security alerts in slack?

This is unfortunately not something we have found an easy solution to. If you are aware of a method please reach out to your nearest AppSec representative!

## Should we still import our new repositories into Snyk?

Yes.

## Do we really only get one month to prepare?

We unfortunately cannot have two solutions active for the entire transition period. This should however not be a major issue for most. Enabling GHAS is fairly straight forward and we are here to help you with the transition.

## Do you still recommending using Trufflehog?

Absolutely, Trufflehog can be automated to run during a pre-commit hook which will significantly reduce the chance that a secret is pushed, although GitHub has push-protection and high quality secret scanning capabilities. You can see the currently supported patterns by GHAS here: <https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#default-patterns>

## Should we have a custom Code Scanning setup?

The default code scanning should be good for most cases. It scans on every commit. You may monitor the consumption in minutes on Github Actions. If that number goes above 1000 minutes a month, then contact the AppSec team. They'll first try to take that consumption down by fine tuning CodeQL. And if that fails, only then we can consider weekly scans instead of every commit.
