# Secure use of YoPass

YoPass is a tool designed to securely share sensitive information, such as passwords and API keys, within our organization. Our internally hosted instance can be accessed [here](https://secrets.equinor.com).

## TLDR;

- Use YoPass to securely share sensitive information such as passwords or API keys.
- Always set an appropriate expiration time for secrets.
- Avoid sharing YoPass links in public or insecure channels.
- Verify YoPass links before accessing them.

!!! note "Weekly Cache Clearance"
    Our hosted instance of YoPass clears its cache every Sunday. Ensure any secrets are accessed within the intended timeframe, as they may be deleted during this routine maintenance.

## Some of the key risks YoPass mitigates

- **Data interception**: By encrypting shared information, YoPass protects secrets from being intercepted during transmission.
  
- **Credential leakage**: Setting expiration times on shared secrets ensures they are only accessible for a limited time, reducing the window for potential leakage.
  
- **Unintended access**: YoPass helps mitigate unauthorized access by enforcing one-time access policies.

- **Phishing and spoofing**: YoPass prevents attackers from spoofing secret links by ensuring secure generation and transmission methods.

## Secure sharing methods

1. **Use Private Channels**: Ensure YoPass links are only shared through secure channels (e.g., encrypted emails, direct private messages). Public sharing of links increases the risk of unauthorized access.

2. **Limit the expiration period**: When sharing a secret, set an appropriate expiration time. This limits the exposure window and ensures secrets are available only for the required duration.

3. **Password Policies**: Secrets shared via YoPass should comply with internal security policies for password complexity and should not be reused across services.

4. **Link verification**: Verify YoPass links before accessing them, ensuring they originate from trusted sources.

5. **Use YoPass for temporary sharing**: Avoid using YoPass for long-term secrets. If the secret is expected to be in use for an extended period, consider other methods such as managed secrets vaults.

By following these best practices, we ensure that YoPass is used effectively to protect sensitive information and mitigate risks.
