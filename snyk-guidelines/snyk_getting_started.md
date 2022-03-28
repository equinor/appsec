# Getting started
Snyk is available to all teams who code in Equinor. First, apply for Snyk in [AccessIT](https://accessit.equinor.com/Search/Search?term=snyk), then ask [#sdpteam](https://equinor.slack.com/archives/C02JJGV05) to create a Snyk organization for your team.

When you have been granted an organization, make sure to log on to [snyk sso](https://app.snyk.io/login/sso) and use your Equinor
email address. Here you can start integrating Snyk with the code you are working with.

## Creating projects
Snyk has many different kinds of integrations, we recommend starting with adding your github repositories. Doing that will create
one snyk project for each source file it understands, e.g. `requirements.txt` or `package-lock.json`. More about github integration
can be found [here](gh-integration.md)

## Project attributes
To be able to do searching, filtering and aggregation of Snyk data, it is highly recommended that you set some attributes on all
projects. Especially the `Lifecycle stage` should be set to an appropriate value, and then `Business criticality` and `Environment`
fields can be set as needed. For more flexible tagging the `Tags` field can be used but it is recommended to be used with care as 
free-form tags can be difficult to maintain.

![Tags](images/snyk_project_attributes.png)

## Privacy
Concerns about which data snyk collects are addressed on Snyk's [privacy policy page](https://snyk.io/policies/privacy/)

## Learn more

{% capture include_links %}{% include_relative snyk_links.md %}{% endcapture %}
{{ include_links | markdownify }}
