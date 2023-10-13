# Guidelines on using Postman

## Lightweight API Client

- This is the default client before the user is logged in to Postman services.
  - The lightweight API client only stores client save data locally.
  - Our recommendation is to use the lightweight client unless you need features from the logged-in client.

## Logged-in client

Logging in with a user account enables most of the features within Postman, this however comes with some security caveats. 

- When using workspaces, collections and environments you potentially expose data.

**Best practices**:

- Avoid storing sensitive data anywhere except in environments.
- Storing variable values **only** in the `Current value` field, will ensure that the data is never shared with Postman.
- You should also use environment variables with a secret type to store sensitive data and credentials, including API keys and access tokens.

### Resources to read more on Postman

- [Postman Security & Trust Portal](https://security.postman.com/)
- [Security | Postman Trust Center](https://www.postman.com/trust/security/)
