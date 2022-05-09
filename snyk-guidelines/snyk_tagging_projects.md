# Tagging Snyk Projects inb Equinor

We use tagging of Snyk projects to assist us in getting useful metrics. Please make sure that your projects are tagged correctly!

## TL;DR

* Omit official scan results for projects from the official Dashboard by setting the "Lifecycle stage" tag to "Sandbox"

## Filtering "noise" from scanning results

Extracts from [Snyk projects](https://docs.snyk.io/getting-started/introduction-to-snyk-projects#projects) are imported into an external dashboard (link-TBA). We use information from this Dashboard to help us increase the security posture of our code products and projects. Quite often teams will scan/import projects that should not be part of the official results. This could be scenarios such as testing Snyk, scanning the same code base from multiple angles (CLI, SCM, Container, ++). For each code-base there should be one "official scanning". For most teams this will quite often be the SCM (Github integration).

The default is that "all" projects will be included in the aggregated Dashboard. To omit a project from the aggregated Dashboard tag your project as follow:
- "Lifecycle Stage" = "Sandbox"