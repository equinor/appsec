# Scan Results

## View Snyk Scan Results

Once you have imported a project, it will be scanned. Learn how to view the scan results [here.](https://docs.snyk.io/getting-started/quickstart/view-snyk-scan-results)

## Interpreting and Prioritizing Snyk Findings

The [Snyk Priority Score](https://docs.snyk.io/features/fixing-and-prioritizing-issues/starting-to-fix-vulnerabilities/snyk-priority-score) is a good reference when prioritizing Snyk findings, and should be taken into consideration. Be mindful that Snyk reports on *potential* vulnerabilities, so you will still need to investigate if the reported issue is a true positive or not.

For [issues with a fix available](https://support.snyk.io/hc/en-us/articles/360000914697-What-can-I-do-if-I-m-vulnerable-), you can trigger Snyk to create a pull-request which addresses the issue. The fix usually involves upgrading the dependency to a vulnerability free version or with a patch. This upgrade might break the code and Snyk will indicate this in the pull-request created. The reviewer is responsible to ensure that the changes in the PR won't cause issues with the project.  

>**In most languages, a minor (1.1.x → 1.2.x) or patch (1.1.1 → 1.1.2) release is considered “non-breaking”. Whilst a major version (1.x.x → 2.x.x) contains breaking changes.**

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

## Interpreting Issues regarding Licenses

### Intro

!!! important "Disabled by default"
    To enable the rule-set that alerts on potential issues, add the "Distributed" environment-tag in your projects. __If you cant see 'Distributed' in the list, try searching for it__

Open source software you use in your projects (eg. libraries) are licensed by the author(s) to ensure that it is used the way the author attended. There are many different licenses out there. Some of them are created to ensure the freedom of use without asking anything in return. Others may require that projects using the licensed software adopt the same license and make their software open and free.

[**Information on why/how Snyk reports on License-issues**](https://docs.snyk.io/products/snyk-open-source/licenses)

*The subject of license-issues is **most** relevant for Equinor's Open Source Software projects, as obligations to comply is usually triggered by distribution.*  

!!! quote "From the [**OSLC-handbook**](https://github.com/finos/OSLC-handbook/blob/master/output/adoc/OSLC-handbook.adoc):"
    **Distribution is defined as:**  
    *providing software to another entity, i.e., an individual or organization outside your company or organization.*


    Determining the requirements that need to be met to comply with open source licenses involves the following:

    1. You must know what open source software you are using;
    2. You must know what license applies to that open source software and the relevant legal interpretation of the license; and
    3. You must know how you using that open source software.

### What to do

We recommend that all teams, regardless of whether they are *distributing* their solutions or not, acquire a working knowledge of the subject of Open Source Licenses.  

You should act when Snyk report on license issues. This will involve investigating the terms of the license in question, and to do the necessary steps to comply.  

Sometimes in order to stay compliant, one might have to adopt a new license for your software, replace the open source software, or in some cases ignore it because you find out you are not under obligation to comply.

!!! example

    This Equinor team maintains an application used by Equinor employees. The source-code is not made available, and the application is only reachable from the internal network.

    Snyk report the following issue:
    ![aglp_issue](./images/agpl_issue.png)

    Investigating the AGPL-3.0 license, looking into the resources linked to at the bottom of this guide, the investigator finds the following useful information:

    > As any distribution of software that is linked to or incorporates AGPL components triggers copyleft, either the entire product must be made available under the AGPL **or the product must only be used strictly internally.**

    Since this is the case for their application, they do not trigger the copyleft clause, and this issue can be resolved without further action.

    What they do next is described bellow.

### What to do after an issue is resolved

After a license-issue is resolved, a good practice would be to document it in Snyk via the 'ignore' button.

![ignore_comment_1](./images/ignore_comment_1.png)
![ignore_comment_1](./images/ignore_comment_2.png)

If you do need assistance, don't be afraid to reach out on [Slack](https://equinor.slack.com/archives/CMM6FSW5V)

### More information

Some useful resources are listed bellow:

* [Snyk Learn - Open Source Licenses](https://snyk.io/learn/open-source-licenses/)

* [Open Source Licenses Explained](https://www.whitesourcesoftware.com/resources/blog/open-source-licenses-explained/)

* [Open Source License Compliance Handbook](https://github.com/finos/OSLC-handbook/blob/master/output/adoc/OSLC-handbook.adoc)  

* [Open Source and Copyleft - How to ensure commercially accepted use](https://www.schjodt.no/en/news--events/newsletters/open-source--copyleft-licenses-how-to-ensure-commercially-acceptable-use/)

Some examples of compliance failures:

* [Common Open Source License Compliance Failures](https://www.linux.com/news/4-common-open-source-license-compliance-failures-and-how-avoid-them/)
* [IT Professional Network in Equinor's guidelines on choosing an open source license for your project](https://github.com/equinor/it-professional-network/blob/master/doc/open_source/licenses.md)  
* [Common Open Source IP Compliance Failures](https://www.linux.com/news/3-common-open-source-ip-compliance-failures-and-how-avoid-them/)
 


