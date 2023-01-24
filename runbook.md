# Runbook appsec.equinor.com

Info pages for Equinor AppSec is available at [https://appsec.equinor.com](https://appsec.equinor.com)

### Deploy
The site is built with [MkDocs](https://www.mkdocs.org/) and deployed with a [Github Action](.github/workflows/azure-static-webapp.yml) to [Azure staic webapp](https://portal.azure.com/#@StatoilSRM.onmicrosoft.com/resource/subscriptions/0141f70a-fe2b-4cee-920e-13f183ca3097/resourceGroups/S382-appsec-static-webpage/providers/Microsoft.Web/staticSites/s382-appsec-static-webpage/staticsite). This action is run on every deploy to the main branch.


### Secrets and certificates

#### Deployment token
The repository secret `AZURE_STATIC_WEB_APPS_API_TOKEN_GRAY_PEBBLE_09FADDD03` is used for deploy to Azure. This secret has not automatic expiry, but can be rotated in Azure Portal.

#### HTTPS Certificate
TLS certificate for appsec.equinor.com is provided by DigiCert for free as a service by Azure. This certificate is updated automatically as long as Equinor has a DNS CNAME record for appsec.equinor.com pointing to `gray-pebble-09faddd03.2.azurestaticapps.net`


### Monitoring
Usage statistics of site traffic is available in [Application Insights](https://portal.azure.com/#@StatoilSRM.onmicrosoft.com/resource/subscriptions/0141f70a-fe2b-4cee-920e-13f183ca3097/resourceGroups/appsec-info-site/providers/microsoft.insights/components/appsec-appinsights/segmentationUsers).


### Infrastructure
The static web app is deployed in Azure in resource group [S382-appsec-static-webpage](https://portal.azure.com/#@StatoilSRM.onmicrosoft.com/resource/subscriptions/0141f70a-fe2b-4cee-920e-13f183ca3097/resourceGroups/S382-appsec-static-webpage/overview).
