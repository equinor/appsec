# Vulnerabilities
When Snyk has identified vulnerabilities in source code, it's time to decide what to do with them. This section will provide some expectations for how to resolve vulnerabilities in Equinor.

## Remediation
Ultimately its up to devOps teams to decide how to remediate vulnerabilities. However, for Equinor to have a total overview of the total security posture of the entire portfolio, we have expectations to how vulnerabilities should be evaluated once they are identified.

Snyk uses four severe levels: low, medium, high and critical to evaluate the risk of a particular vulnerability. The expected action depends on the severity of a given vulnerability.

| Level | Description |
| --- | --- |
| **Critical** | This may allow attackers to access sensitive data and run code on your application |
| **High** | This may allow attackers to access sensitive data in your application |
| **Medium** | Under some conditions, this may allow attackers to access sensitive data on your application |
| **Low** | Application may expose some data that allows vulnerability mapping, which can be used with other vulnerabilities to attack the application |

### Critical
Vulnerabilities should be evaluated and remediated as soon as possible. If a vulnerability is critical, there shall be a plan for either fixing or removing the vulnerability within **24 hours**.

### High
High vulnerabilities should be evaluated and remediated as soon as possible. If a vulnerability is high, there shall be a plan for either fixing or removing the vulnerability within **7 days**.

### Medium
Medium vulnerabilities should be evaluated and remediated. If a vulnerability is medium, there shall be a plan for either fixing or removing the vulnerability within **30 days**.

### Low
If a vulnerability is low, it should be evaluated to see if a fix is available.

## Priority score
Snyk also provides a priority score from 0-1000 for each vulnerability. This score is based on the severity of the vulnerability, the number of affected projects and the number of affected users. The priority score is used to prioritize the work of the devOps teams. Note that the priority score may vary from project to project based on wether a fix is available or not.


## Ignoring vulnerabilities
If the detected vulnerability is not applicable to your project, it can be [ignored](https://docs.snyk.io/manage-issues/issue-management/ignore-issues#ignoring-issues-in-the-web-ui) with a comment explaining why it should be ignored.

If the vulnerability is in a project not in production it can be tagged with the lifecycle tag "[sandbox](./guidelines/3-snyk_tagging_projects.md)" to exclude it from the aggregated dashboard.


## Who to contact
Please reach out to the AppSec team on [Slack](https://app.slack.com/client/T02JL00JU/CMM6FSW5V) or email at ``appsec[at]equinor.com`` if you have any questions regarding evaluating vulnerabilities.

## Further resources
- [Snyk severity levels](https://docs.snyk.io/manage-issues/issue-management/severity-levels)
- [Priority score](https://docs.snyk.io/manage-issues/issue-management/priority-score)
- [Guideline: Interpreting and prioritizing Snyk findings](./guidelines/2-snyk_interpret_and_prioritize.md)
