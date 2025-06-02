# GHAS Transition FAQ

## How can I get security alerts in slack?

This is unfortunately not something we have found an easy solution to. If you are aware of a method please reach out to your nearest AppSec representative!

## Should we still import our new repositories into Snyk?

Yes.

## Do we really only get one month to prepare?

We unfortunately cannot have two solutions active for the entire transition period. This should however not be a major issue for most. Enabling GHAS is fairly straight forward and we are here to help you with the transition.

## Will there be an onboarding session?

There is no onboarding session planned as of now, the FAQ should be enough to get everyone up and running, and you're encouraged to ask in the AppSec Slack channel should there be anything you're wondering about.

## Do you still recommending using Trufflehog?

Absolutely, Trufflehog can be automated to run during a pre-commit hook which will significantly reduce the chance that a secret is pushed. Although GitHub does have push-protection and high quality secret scanning capabilities. You can see the currently supported patterns by GHAS here: <https://docs.github.com/en/enterprise-cloud@latest/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#default-patterns>

## Any general guidelines for container scanner?

We are currently evaluating open source alternatives like Grype and Trivy.
At the moment, there are no guidelines on container scanner currently but we are working on releasing some as soon as possible.

## What dashboards will I have access to? How can I see vulnerability trends?

With GHAS, you'll have access to the security tab in each repository, where you can view code scanning alerts, secret scanning results, and dependabot insights (dependencies).

For broader visibility, the organization level security tab provides aggregated data across all repos you have access to. Here you can find an overview on alerts over time, security risks currently open and security coverage. You can also see all your dependabot, code scanning and secret scanning alerts across all repos.

## Is AppSec publishing some guidelines / best practices for enabling and configuring GHAS anytime soon?

Yes, all relevant guidelines and best practices will be available here soon!  

## Should we scan with CodeQL on every commit?

Scan on every commit as a start, and monitor to consumptions in minutes on Github Actions. If that number goes above 1000 minutes a month, then contact the AppSec team. They'll first try to take that consumption down by fine tuning CodeQL. And if that fails, only then we can consider weekly scans instead of every commit.
