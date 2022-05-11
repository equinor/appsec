# Tagging Snyk Projects in Equinor

We use tagging of Snyk projects to assist us in getting useful metrics. Please make sure that your projects are tagged correctly!

## TL;DR

* Omit official scan results for projects from the official Dashboard by setting the "Lifecycle stage" tag to "Sandbox"
* For OpenSource project, set the project's "Environment" tag to "Distributed" (you will have to start typing for it to show up on the list)

## Filtering "noise" from scanning results

Extracts from [Snyk projects](https://docs.snyk.io/getting-started/introduction-to-snyk-projects#projects) are imported into an external dashboard (link-TBA). We use information from this Dashboard to help us increase the security posture of our code products and projects. Quite often teams will scan/import projects that should not be part of the official results. This could be scenarios such as testing Snyk, scanning the same code base from multiple angles (CLI, SCM, Container, ++). For each code-base there should be one "official scanning". For most teams this will quite often be the SCM (Github integration).

The default is that "all" projects will be included in the aggregated Dashboard. To omit a project from the aggregated Dashboard tag your project as follow:
- "Lifecycle Stage" = "Sandbox"


## Toggling the rule-set for Equinor's OpenSource distributed projects

We have configured Snyk to no longer _by default_ alert of potential license issues for projects. If your project is distributed (ex. exposed on the internet, source-code is OpenSource), you should use the tag "Distributed" in the Environment section. This will enable the correct rule-set for your project.

>__If you cant see 'Distributed' in the list, try searching for it!__
