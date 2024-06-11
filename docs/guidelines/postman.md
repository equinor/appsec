# Postman

!!! info
    Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster.

## Changes in 2023

During 2023, Postman [announced a change 🔗](https://blog.postman.com/announcing-new-lightweight-postman-api-client/) on how the solution works by making it mainly "cloud only", meaning they expect any users of the solution to always have an account and being logged in. When utilizing Postman, it's crucial to note that being logged in will _automatically_ sync data to the cloud. As a result, users must exercise caution regarding the nature of data being transmitted. It's especially important to pay attention to the **data's classification**, both within the **requests** (such as API keys and personal information) and in the **responses**.

## Benefits of being logged in with an user account
Logging in with a user account enables most of the features within Postman, including:

- Workspaces
- Collections
- Sharing and collaboration
- **Automatic synchronization to the cloud / backup**

However, the automatic synchronization to the cloud imposes both security and regulationary concerns. Here are the results of a _a simple_ Threat Model exercise:

| Threat | Description | Mitigation |
|---|---|---|
|Information disclosure|The API being tested has sensitive data in the responses - could be `confidential` or `personal` data - which would automatically be uploaded to the cloud|Know what data classification the data in the **requests and responses** belongs to and if uncertain, try to avoid using Postman. When using automatic testing, ensure tests are being performed against a "synthetic" test environment|
|Account takeover / session hijacking|The account is breached and malicious actors can log in to Postman using your account|Only use SSO as there are protective and preventive measures in place to avoid/detect malicious actors logging in|
|Data breach at Postman servers|A malicious actor has obtained data residing on the Postman servers|Avoid storing sensitive data that is being synchronized towards Postman servers|
|Credentials stored unencrypted|Storing credentials in plain-text fields, in local plain-text files|Use proper solutions when handling credentials, like Postman Vault or use OAuth 2.0 authorization flows without client secrets (require user to log in through SSO)|


## Best practices
The automatic synchronization to the cloud imposes both security and regulationary concerns.
Following the best practices will mitigate some of those concerns.

### SSO
_Never_ use a private or non-Equinor account in an Equinor context.
If needing the full feature set of Postman, request access through AccessIT and use SSO for login. 
This ensures 
  - that the proper security checks on the account can be enforced (e.g. avoid logins from completely strange IPs, known malicious IP)
  - that access control is properly enforced
  - that access can properly be revoked
  - that policies are followed and are enforced
  - and others ...

### Avoid storing sensitive data (in an insecure way)
If needing to store credentials or other sensitive data, use [Postman Vault 🔗](https://learning.postman.com/docs/sending-requests/postman-vault/postman-vault-secrets/). Note that the latter is _not_ being synchronized with Postman and anything in the Vault remains local.

If sensitive data is being stored in the environment, you should set the type to "secret". This will mask the input.

!!! important "Be careful"
    Even though one uses the "secret" type in an Environment, the secret is readable in plain-text by anyone who has access to it. If the access of the Workspace is set to Team, anyone in Equinor with a Postman account will be able to read the secret.

!!! tip "Tip"
    Storing variable values **only** in the `Current value` field, will ensure that the data is never shared with Postman. For more comprehensive explanation between `Initial value` and `Current value` [see Postman documentation 🔗](https://learning.postman.com/docs/sending-requests/variables/variables/#initial-and-current-values).

## Postman Vault
[Postman Vault 🔗](https://learning.postman.com/docs/sending-requests/postman-vault/postman-vault-secrets/) is a way of handling sensitive data in Postman, without it leaving your local environment. Use the link to do a bit more of a deep-dive of the Postman Vault capabilities. Note that Postman Vault is only available when using the Desktop Client and will not function when using the Web Client (using Postman through the browser).
If unsure on how to set up and open a vault, use the link above.

The syntax to use a vault variable is quite similar to how other variables are refrenced, but with a prefix of "vault:". For example to reference a value called "MY_SECRET" stored in the Vault, one would reference it by `{{vault:MY_SECRET}}`.

!!! important
    Note that you can't set or access vault secrets in scripts [🔗](https://learning.postman.com/docs/sending-requests/variables/variables/#defining-variables-in-scripts).

### Do not share collections (uncritically)
If needing to share collections within the team, ensure proper processes are in place to give and _revoke_ access. Note that collaborators might get access and see any sensitive information in the collections, including any sensitive information either in the Workspace variables or the configured environments.

### Set right access on Workspace
The default access is "Eveyone from team Equinor", which makes is visible to _everyone_ in Equinor who have an Postman account, which. The access will give anyone in the "team" access to the entire workspace, including the environments and the secrets within, _might_ not be desirable.

To change the access of a workspace, go to the workspace "root page" and click on the "Workspace Settings" button. Under the new page set the "Who can access this workspace?" to "Only invited team members". 

!!! info
    Changing to "Only invited team members" imposes additional administrative work, as the administrator of the Workspace needs to onboard _and offboard_ team members.

## CI/CD
It is possible to run Postman collections automatically in a CI/CD pipeline. One way of achieving this is using the [Newman CLI 🔗](https://learning.postman.com/docs/collections/using-newman-cli/command-line-integration-with-newman/), a CLI tool by Postman.

Assuming 
* one has exported the desired collection to a `collection.json` file, 
* set up [Postman API Key 🔗](https://learning.postman.com/docs/developer/postman-api/authentication/#generate-a-postman-api-key)
* configured `POSTMANAPIKEY` as a github action secret
* [obtained 🔗](https://support.postman.com/hc/en-us/articles/5063785095319-How-to-find-the-ID-of-an-element-in-Postman) the `collectionId`

a GitHub Action workflow _could_ look something like:
``` YAML
name: Running API tests
run-name: ${{ github.actor }} is testing the API
on: [pull_request]
jobs:
    api_tests:
        runs-on: ubuntu-latest
        steps:
            - name: Set up Node
              uses: actions/setup-node@v4
            - name: Install Newman
              run: npm install -g newman 
            - name: Run API tests
              run: newman run "https://api.getpostman.com/collections/${{collectionID}}?apikey=${{ secrets.POSTMANAPIKEY }}" --environment "https://api.getpostman.com/environments/${{ environmentID }}?apikey=${{ secrets.POSTMANAPIKEY }}"
            
```

Some considerations on this workflow:

* [The Postman API is rate-limited](https://learning.postman.com/docs/developer postman-api/postman-api-rate-limits/), so keep that in mind when running automatic workflows.
* The generated `POSTMANAPIKEY` should be considered as a PAT - it gives the workflow the same access as _your_ account.
* This example uses the enivornment obtained through the Postman API _as-is_. Consider if the environment could contain sensitive data (e.g. client secrets). These entries could then instead be placed in a secure Vault (e.g. Azure KeyVault), which would introduce some extra steps in the workflow; extracting Postman environment in separate step, logging into Azure, extracting data from the KeyVault, [using secrets as input parameters 🔗](https://github.com/postmanlabs/newman?tab=readme-ov-file#newman-run-collection-file-source-options) to Newman


## Lightweight API Client
The "old" lightweight API client, based on "Scratch Pad", has been discountinued and there is only a single official API Client that can be downloaded.
After downloading and executing the file, there is a choice of `Or continue with the lightweight API client.` (as of April 2024, this represents itself as a small text below the login-button on starting the application). Running the application in this mode will ensure that everything stays local - nothing is being synchronized to the cloud. However, it will not be possible to use the full set of features Postman provides and the usage in this mode will be limited to simple manual API testing.

!!! info
    Using the Lightweight client is free and one does not need to apply for access in AccessIT. In many cases this will be sufficient.


## Resources to read more on Postman

- [Announcement to new API client](https://blog.postman.com/announcing-new-lightweight-postman-api-client/)
- [Newman repository](https://github.com/postmanlabs/newman)
- [Postman Security & Trust Portal](https://security.postman.com/)
- [Postman Trust Center](https://www.postman.com/trust/security/)
- [Postman Vault](https://learning.postman.com/docs/sending-requests/postman-vault/postman-vault-secrets/)

