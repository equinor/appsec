# Integrations

Integrations are merely ways to connect and interact with Snyk. You can find all the supported integrations [here.](https://snyk.io/integrations/)

## Recommended Integrations

### 1. Github Integration

We recommend starting with adding your github repositories. The easiest way to do this is by adding the [Github integration](https://docs.snyk.io/integrations/git-repository-scm-integrations/snyk-github-integration#how-to-connect-github-to-snyk). Doing this will create one snyk project for each source file it understands, e.g. `requirements.txt` or `package-lock.json`. 

Configuration settings for this integration can be found here.

Please ensure the following:

-   [Automatic fix pull requests](https://docs.snyk.io/integrations/git-repository-scm-integrations/snyk-github-integration#project-monitoring-and-automatic-fix-pull-requests)
    -   It can be set to either fail only when the PR adds a new dependency issue, or for all issues. 
    -   It can also be selected if it should fail for high or critical issues, and only if there is a fix available. 
-   [Automatic Dependency Upgrade PRs](https://docs.snyk.io/scan-applications/snyk-open-source/open-source-basics/upgrading-dependencies-with-automatic-prs) 
-   [Verify PR checks are configured.](https://docs.snyk.io/scan-applications/run-pr-checks/configure-pr-checks#configure-pr-checks-at-the-integration-level)

### 2. IDE Integration 

It is recommended to use Snyk IDE plugins while developing applications. This is in addition to the Github integration.

The results of a vulnerability scan show issues with context, impact, and fix guidance in your IDE, where the fix for the vulnerability can be done right in the IDE itself.

Read more [here.](https://docs.snyk.io/integrations/ide-tools)