# Sharing secrets (Yopass)

Yopass is a tool designed to securely share sensitive information, such as passwords and API keys, within our organization. Our internally hosted instance can be accessed [here - secrets.equinor.com](https://secrets.equinor.com).

## TL;DR

- **Use Yopass** to securely share sensitive information like passwords or API keys.
- **Always set an appropriate expiration time** for secrets.
- **Transmit the Yopass link and decode key via separate, secure channels** whenever possible.
- **Verify Yopass links before accessing them**.

!!! note "Weekly Cache Clearance"
    Our hosted instance of Yopass clears its cache every Sunday. Ensure any secrets are accessed within the intended timeframe, as they may be deleted during this routine maintenance.

## Key Risks Yopass Mitigates

- **Data interception**: By encrypting shared information, Yopass protects secrets from being intercepted during transmission.

- **Credential leakage**: Setting expiration times on shared secrets ensures they are only accessible for a limited time, reducing the window for potential leakage.

- **Unintended access**: Yopass helps mitigate unauthorized access by enforcing one-time access policies.

## Secure Sharing Guidelines

1. **Protect the Combination of Link and Decode Key**

    - Individually, the Yopass link and decode key are harmless. However, when **combined**, they grant access to the secret and should collectively be handled with the same level of confidentiality as the secret itself.

2. **Transmit Link and Decode Key Separately**

    - Whenever possible, send the Yopass link and the decode key via **separate communication channels** to minimize the risk of unauthorized access.
        - *Example*: Send the link via email and the decode key via a direct message on teams.

3. **Use Secure Communication Channels**

    - Share the Yopass link and decode key through **secure channels** (e.g. email, secure messaging apps).

    - **Avoid using public or unsecured networks** to transmit sensitive information.

4. **Limit the Expiration Period**

    - Set an appropriate **expiration time** when sharing a secret. This limits the exposure window and ensures secrets are available only for the required duration.

    - Use the **one-time retrieval** feature to ensure the secret can only be accessed once.

5. **Password Policies**

    - Secrets shared via Yopass should comply with [internal security policies](https://aris.equinor.com/#default/search/~AfBbImNvbXBvbmVudF9jb21tZW50U3RyZWFtMTUzIl0~) and **should not be reused across services**.

6. **Link Verification**

    - **Verify Yopass links before accessing them** to ensure they originate from trusted sources.

7. **Use Yopass for Temporary Sharing**

    - Avoid using Yopass for long-term secrets. If the secret is expected to be in use for an extended period, consider other methods such as managed secrets vaults.

!!! important "**Exceptions and Practical Considerations**"
    In scenarios where sending both the link and decode key together is necessary (e.g., time-sensitive situations or recipient limitations), ensure that:
    
    - A **secure communication channel** is used.
    - The recipient is instructed to **access the secret promptly**.

