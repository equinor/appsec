---
layout: page
title: "How to interpret and prioritize Snyk findings"
---


The [Snyk Priority Score](https://docs.snyk.io/features/fixing-and-prioritizing-issues/starting-to-fix-vulnerabilities/snyk-priority-score) is a good reference when prioritizing Snyk findings, and should be taken into consideration. Be mindful that Snyk reports on *potential* vulnerabilities, so you will still need to investigate if the reported issue is a true positive or not.

For [issues with a fix available](https://support.snyk.io/hc/en-us/articles/360000914697-What-can-I-do-if-I-m-vulnerable-), you can trigger Snyk to create a pull-request which addresses the issue. The fix usually involves upgrading the dependency to a vulnerability free version or with a patch. This upgrade might break the code and Snyk will indicate this in the pull-request created. The reviewer is responsible to ensure that the changes in the PR won't cause issues with the project.  
*In most languages, a minor (1.1.x → 1.2.x) or patch (1.1.1 → 1.1.2) release is considered “non-breaking”. Whilst a major version (1.x.x → 2.x.x) contains breaking changes.*

For [issues with no fix available](https://support.snyk.io/hc/en-us/articles/4403030244369-What-do-we-do-when-Snyk-finds-vulnerabilities-for-which-there-is-no-fix-available-) it is up to the developers to evaluate how to handle this - whether it be explicitly ignoring the issue until a fix is available, replacing the dependency, or removing the dependency all together as you discover it is not really needed.

>**On a side-note:**  
>It is a good practice to define **[Security Requirements](https://owasp.org/www-project-proactive-controls/v3/en/c1-security-requirements)** for your applications. In the context of adopting Snyk, it makes a lot of sense to add a requirement covering the how long exposure window is tolerated for your application.
>
> Ex.
>> The remediation time of newly discovered vulnerabilities for our application will take no longer than:  
>> <span style="color:darkred">**Critical:   < 7 days**  
>> <span style="color:red">**High: < 30 days**  
>> <span style="color:yellow">**Medium-Low: Resolve based on availability**  
>  

For more information, see [Snyk's documentation](https://docs.snyk.io/features/fixing-and-prioritizing-issues)
