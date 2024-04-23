# Authentication and Authorization

Authentication and Authorization are complex topics. Things are often very context specific. Answers are often not straight forward, we often have more than one option. In the sections below we will give advice on protocols, tools and principle we find helpful.

The scope for this guideline is web application and api's.


## Best current practices and guidelines

- Microsoft's [Identity Platform](https://learn.microsoft.com/en-us/entra/identity-platform/) is the primary component in our set-up.
- We use Microsoft Entra ID (was Azure AD) as our primary identity provider and authorization server.
- We use oAuth2 to facilitate authorization
    - [Authorization Code Flow](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-auth-code-flow) is often the preferred flow 
    - We avoid the "Implicit Grant Flow"
    - Public Clients should use Auth Code Flow with PKCE
- We use OpenId Connect (OIDC) as an authentication layer on top of oAuth2 
- We use SAML2/OIDC for federation
- We refer to the MS Identity Platform for implementation guidelines</br> (guides for web, api, desktop, mobile, service, deamon/script, example code, sdk and libraries)
- We prefer [Microsoft Authentication Library (MSAL)](https://learn.microsoft.com/en-us/entra/identity-platform/msal-overview) to implement AuthN and AuthZ in our code.

</br>

- For Web applications we prefer the Backend-For-Frontend Pattern (BFF)
- We usually do not develop "multitenant applications". If we do we are aware of the risks.

</br>

- Using oAuth2 proxies as a front door to app authentication is ok as long as the team understand and manage the risks involved.
- We advocate a "Security in depth" mindset, only protecting the front-door will not do it
- We prefer managed identities over service principals when available ([MS Workload Identities](https://learn.microsoft.com/en-us/entra/workload-id/workload-identities-overview))


</br>

- We refer to the Appsec Fundamentals A&A workshop for training (below)
- We strongly suggest doing continuous threatmodeling for A&A work
- We strongly state that teams must have sufficient knownledge on A&A

## Equinor "quirks"

- We use conditional access for most our accounts and identities. Parts of this is implemented as "managed device"
    - The [Device Code Flow](https://datatracker.ietf.org/doc/html/rfc8628) will not work on a managed device. 
- The [Omnia Docs](https://docs.omnia.equinor.com/services/data/concept/authentication-the-basics/) contains important information on AuthN, AuthZ, Entra ID, consent etc.

## Training

We have a 2 day workshop in Authn & AuthZ, it's open source and available at [https://github.com/equinor/appsec-fundamentals-authn-authz-cs](https://github.com/equinor/appsec-fundamentals-authn-authz-cs)

