# Runbook appsec.equinor.com

Info pages for Equinor AppSec is available at [https://appsec.equinor.com](https://appsec.equinor.com)

## Hosting

The website is hosted as a static web app in Azure in the "S382-appsec-static-webpage" resource group.

## Deploy

The site is built with [MkDocs](https://www.mkdocs.org/) and deployed with a [Github Action](.github/workflows/azure-static-webapp.yml) to the Azure static webapp. This action is run on every deploy to the main branch.

## Secrets and certificates

### Deployment token

The repository secret `AZURE_STATIC_WEB_APPS_API_TOKEN_GRAY_PEBBLE_09FADDD03` is used for deploy to Azure. This secret has not automatic expiry, but can be rotated in Azure Portal.

### HTTPS Certificate

TLS certificate for appsec.equinor.com is provided by DigiCert for free as a service by Azure. This certificate is updated automatically as long as Equinor has a DNS CNAME record for appsec.equinor.com pointing to `gray-pebble-09faddd03.2.azurestaticapps.net`

## Monitoring

Usage statistics of site traffic is available in Application Insights. Metrics are collected by injecting JavaScript into the header. The [privacy policy](./docs/about/privacy.md) reflects this.

Please note; many ad-blockers and privacy extensions will block this metrics collection so numbers may not be accurate.
