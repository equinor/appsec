# Projects

## Import a Project
Snyk Projects are items that Snyk scans for issues, for example, a manifest file listing your open-source dependencies.
When you import a Project, Snyk scans that imported Project, and displays the results for you to review.

Check how to import a project [here.](https://docs.snyk.io/getting-started/quickstart/import-a-project)

## Tagging Snyk Projects in Equinor

We use tagging of Snyk projects to assist us in getting useful metrics. Please make sure that your projects are tagged correctly!

### TL;DR

* Omit official scan results for projects from the official Dashboard by setting the "Lifecycle stage" tag to **"Sandbox"** (Must be org admin)
* For OpenSource project, set the project's "Environment" tag to **"Distributed"** (you will have to start typing for it to show up on the list)

### Filtering "noise" from scanning results

Extracts from [Snyk projects](https://docs.snyk.io/getting-started/introduction-to-snyk-projects#projects) are imported into an external dashboard. We use information from this Dashboard to help us increase the security posture of our code products and projects. Quite often teams will scan/import projects that should not be part of the official results. This could be scenarios such as testing Snyk, scanning the same code base from multiple angles (CLI, SCM, Container, ++). For each code-base there should be one "official scanning". For most teams this will quite often be the SCM (Github integration).

The default is that "all" projects will be included in the aggregated Dashboard. To omit a project from the aggregated Dashboard change the "Life Cycle" tag for your project as follow:

-   "Lifecycle Stage" = "Sandbox"

The role **Org Admin** is required to make a change to the "Life cycle" tag.

### Toggling the rule-set for Equinor's OpenSource distributed projects

We have configured Snyk to no longer _by default_ alert of potential license issues for projects. If your project is distributed (ex. exposed on the internet, source-code is OpenSource), you should use the tag "Distributed" in the Environment section. This will enable the correct rule-set for your project.

>__If you cant see 'Distributed' in the list, try searching for it!__
