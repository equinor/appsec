# Getting started
Snyk is available to all teams who code in Equinor. 

- First, apply for Snyk in [AccessIT](https://accessit.equinor.com/Search/Search?term=snyk)
- Make sure to log on to [snyk sso](https://app.snyk.io/login/sso) and use your Equinor email address.
- Then EITHER
    - Create your Snyk organization using [Snyk-org-maker](https://app-snyk-org-maker-prod.radix.equinor.com/) for your team if it does not already have one.
    - Ask your org-admin to add you to your teams organization

After your first time sign in, you will be able to list organizations available at the Equinor Group overview (top level). If you see a relevant org to join, request one of the listed org admins to add you to the org.

## Creating projects
Snyk has many different kinds of integrations, we recommend starting with adding your github repositories. Doing that will create
one snyk project for each source file it understands, e.g. `requirements.txt` or `package-lock.json`. More about github integration
can be found [here](guidelines/1-gh-integration.md)

## Project attributes
To be able to do searching, filtering and aggregation of Snyk data, it is highly recommended that you set some attributes on all
projects. Especially the `Lifecycle stage` should be set to an appropriate value, and then `Business criticality` and `Environment`
fields can be set as needed. For more flexible tagging the `Tags` field can be used but it is recommended to be used with care as
free-form tags can be difficult to maintain.

![Tags](guidelines/images/snyk_project_attributes.png)

## Privacy
Concerns about which data snyk collects are addressed on Snyk's [privacy policy page](https://snyk.io/policies/privacy/)

