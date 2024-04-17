# Postman

Postman is a popular tool for API life cycle and they probably explain it best themselves:
> Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster.

## Changes in 2023

During 2023, Postman [announced a change](https://blog.postman.com/announcing-new-lightweight-postman-api-client/) in how the solution works by making it mainly "cloud only",
meaning they expect any users of the solution to always have an account and being logged in (for _simple_ usage of Postman one can start the application using ["Lightweight API Client"](#lightweight-api-client)).

## Lightweight API Client
The "old" lightweight API client, based on "Scratch Pad", has been discountinued and there is only a single official API Client that can be downloaded.
When starting this file, there is a choice of `Or continue with the lightweight API client.` (as of April 2024, this represents itself as a small text below the login-button on starting the application).

Running the application in this mode will ensure that everything stays local - nothing is being synchronized to the cloud.
However, it will not be possible to use the full set of features Postman provides and the usage in this mode will be limited to simple manual API testing.

## Benefits of logging in with a user account
Logging in with a user account enables most of the features within Postman, including:

- Workspaces
- Collections
- Sharing and collaboration
- **Automatic synchronization to the cloud**

## Best practices
The automatic synchronization to the cloud has been and is being discussed, as it imposes both security and regulationary concerns.
Following the best practices will mitigate some of those concerns.
- Do _not_ use a private account.
  - If needing the full feature set, request access through AccessIt and use SSO for login.
- Avoid storing sensitive data anywhere except in environments.
- Take great care with whom collections are shared.
- Storing variable values **only** in the `Current value` field, will ensure that the data is never shared with Postman.
- You should also use environment variables with a secret type to store sensitive data and credentials, including API keys and access tokens.

### Resources to read more on Postman

- [Postman Security & Trust Portal](https://security.postman.com/)
- [Security | Postman Trust Center](https://www.postman.com/trust/security/)
- [Announcement to new API client](https://blog.postman.com/announcing-new-lightweight-postman-api-client/)


